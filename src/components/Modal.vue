<template>
    <div v-if="isShow" @click.self="show=false" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <div class="row">
                <div class="col-6">
                    <h4>Checkout</h4>
                    <p>Cashier : Pevita Pearce</p>
                </div>
                <div class="col-6">
                    <p style="text-align: right;">Receipt no: # 010410919</p>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <h6>Coffee Latte 1x</h6>
                    <h6>Black Forest 1x</h6>
                    <h6>Salmon Truffle Teriyaki 1x</h6>
                    <h6>Ppn 10%</h6>
                    <br>
                    <h6>Payment: Cash</h6>
                </div>
                <div class="col-6 right">
                    <h6>Rp. 15.000</h6>
                    <h6>Rp. 30.000</h6>
                    <h6>Rp. 60.000</h6>
                    <h6>Rp. 10.500</h6>
                    <h6>Total : Rp. 115.500</h6>
                </div>
            </div>
            <a href="index.html" class="btn btn-primary checkout-btn">Print</a>
            <h6 style="text-align: center; margin-top:10px">Or</h6>
            <a class="btn btn-danger cancel-btn" style="margin-top:1px">Send Email</a>
        </div>
    </div>
</template>

<script>
export default {
    name : 'Modal',
    props : {
        show : {
            type : Boolean,
            required : true,
        }
    },
}
</script>

<style>

</style>