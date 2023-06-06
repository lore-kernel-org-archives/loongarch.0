Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73127F
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 01:38:51 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8AxhfAkjn5kQ0sAAA--.898S3;
	Tue, 06 Jun 2023 09:38:44 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxReQjjn5kspMBAA--.7207S3;
	Tue, 06 Jun 2023 09:38:43 +0800 (CST)
Message-ID: <778f0a0e-39b1-8e1b-2dae-8d81f01ce2fe@loongson.cn>
Date: Tue, 6 Jun 2023 09:38:43 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 23/31] LoongArch: KVM: Implement handle gspr exception
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, Xi Ruoyao <xry111@xry111.site>
References: <20230530015223.147755-1-zhaotianrui@loongson.cn>
 <20230530015223.147755-24-zhaotianrui@loongson.cn>
From: "bibo, mao" <maobibo@loongson.cn>
In-Reply-To: <20230530015223.147755-24-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxReQjjn5kspMBAA--.7207S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZFW3tF4UWw1Duw1UKF18tFc_yoW5tFyDpr
	WUZ34S9rWkJFy2ywnIqF4Y9rn09w4ktry7XasxJ343WrWDt3s5Jr40krZFyFs0kr93AF4x
	Z3W5trnruFZFywcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
	xGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIeT5DUUUU

Reviewed-by: Bibo, Mao <maobibo@loongson.cn>


在 2023/5/30 09:52, Tianrui Zhao 写道:
> Implement kvm handle gspr exception interface, including emulate the
> reading and writing of cpucfg, csr, iocsr resource.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  arch/loongarch/kvm/exit.c | 115 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
> index 3fdb42939a05..26283a9d3c6d 100644
> --- a/arch/loongarch/kvm/exit.c
> +++ b/arch/loongarch/kvm/exit.c
> @@ -208,3 +208,118 @@ int _kvm_emu_idle(struct kvm_vcpu *vcpu)
>  
>  	return EMULATE_DONE;
>  }
> +
> +static int _kvm_trap_handle_gspr(struct kvm_vcpu *vcpu)
> +{
> +	enum emulation_result er = EMULATE_DONE;
> +	struct kvm_run *run = vcpu->run;
> +	larch_inst inst;
> +	unsigned long curr_pc;
> +	int rd, rj;
> +	unsigned int index;
> +
> +	/*
> +	 *  Fetch the instruction.
> +	 */
> +	inst.word = vcpu->arch.badi;
> +	curr_pc = vcpu->arch.pc;
> +	update_pc(&vcpu->arch);
> +
> +	trace_kvm_exit_gspr(vcpu, inst.word);
> +	er = EMULATE_FAIL;
> +	switch (((inst.word >> 24) & 0xff)) {
> +	case 0x0:
> +		/* cpucfg GSPR */
> +		if (inst.reg2_format.opcode == 0x1B) {
> +			rd = inst.reg2_format.rd;
> +			rj = inst.reg2_format.rj;
> +			++vcpu->stat.cpucfg_exits;
> +			index = vcpu->arch.gprs[rj];
> +
> +			vcpu->arch.gprs[rd] = read_cpucfg(index);
> +			/* Nested KVM is not supported */
> +			if (index == 2)
> +				vcpu->arch.gprs[rd] &= ~CPUCFG2_LVZP;
> +			if (index == 6)
> +				vcpu->arch.gprs[rd] &= ~CPUCFG6_PMP;
> +			er = EMULATE_DONE;
> +		}
> +		break;
> +	case 0x4:
> +		/* csr GSPR */
> +		er = _kvm_handle_csr(vcpu, inst);
> +		break;
> +	case 0x6:
> +		/* iocsr,cache,idle GSPR */
> +		switch (((inst.word >> 22) & 0x3ff)) {
> +		case 0x18:
> +			/* cache GSPR */
> +			er = EMULATE_DONE;
> +			trace_kvm_exit_cache(vcpu, KVM_TRACE_EXIT_CACHE);
> +			break;
> +		case 0x19:
> +			/* iocsr/idle GSPR */
> +			switch (((inst.word >> 15) & 0x1ffff)) {
> +			case 0xc90:
> +				/* iocsr GSPR */
> +				er = _kvm_emu_iocsr(inst, run, vcpu);
> +				break;
> +			case 0xc91:
> +				/* idle GSPR */
> +				er = _kvm_emu_idle(vcpu);
> +				break;
> +			default:
> +				er = EMULATE_FAIL;
> +				break;
> +			}
> +			break;
> +		default:
> +			er = EMULATE_FAIL;
> +			break;
> +		}
> +		break;
> +	default:
> +		er = EMULATE_FAIL;
> +		break;
> +	}
> +
> +	/* Rollback PC only if emulation was unsuccessful */
> +	if (er == EMULATE_FAIL) {
> +		kvm_err("[%#lx]%s: unsupported gspr instruction 0x%08x\n",
> +			curr_pc, __func__, inst.word);
> +
> +		kvm_arch_vcpu_dump_regs(vcpu);
> +		vcpu->arch.pc = curr_pc;
> +	}
> +	return er;
> +}
> +
> +/*
> + * Execute cpucfg instruction will tirggerGSPR,
> + * Also the access to unimplemented csrs 0x15
> + * 0x16, 0x50~0x53, 0x80, 0x81, 0x90~0x95, 0x98
> + * 0xc0~0xff, 0x100~0x109, 0x500~0x502,
> + * cache_op, idle_op iocsr ops the same
> + */
> +static int _kvm_handle_gspr(struct kvm_vcpu *vcpu)
> +{
> +	enum emulation_result er = EMULATE_DONE;
> +	int ret = RESUME_GUEST;
> +
> +	er = _kvm_trap_handle_gspr(vcpu);
> +
> +	if (er == EMULATE_DONE) {
> +		ret = RESUME_GUEST;
> +	} else if (er == EMULATE_DO_MMIO) {
> +		vcpu->run->exit_reason = KVM_EXIT_MMIO;
> +		ret = RESUME_HOST;
> +	} else if (er == EMULATE_DO_IOCSR) {
> +		vcpu->run->exit_reason = KVM_EXIT_LOONGARCH_IOCSR;
> +		ret = RESUME_HOST;
> +	} else {
> +		kvm_err("%s internal error\n", __func__);
> +		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
> +		ret = RESUME_HOST;
> +	}
> +	return ret;
> +}

