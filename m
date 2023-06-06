Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9DD62E
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 03:20:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.86])
	by gateway (Coremail) with SMTP id _____8CxZPAWpn5kqloAAA--.964S3;
	Tue, 06 Jun 2023 11:20:54 +0800 (CST)
Received: from [10.20.42.86] (unknown [10.20.42.86])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxluQVpn5kObABAA--.7496S3;
	Tue, 06 Jun 2023 11:20:53 +0800 (CST)
Subject: Re: [PATCH v12 10/31] LoongArch: KVM: Implement vcpu ENABLE_CAP ioctl
 interface
To: "bibo, mao" <maobibo@loongson.cn>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
References: <20230530015223.147755-1-zhaotianrui@loongson.cn>
 <20230530015223.147755-11-zhaotianrui@loongson.cn>
 <3f352d6f-2d4f-0b41-f015-991ba8421007@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, Xi Ruoyao <xry111@xry111.site>
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <9ab60c16-8276-c46e-951a-434e936264c8@loongson.cn>
Date: Tue, 6 Jun 2023 11:20:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3f352d6f-2d4f-0b41-f015-991ba8421007@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxluQVpn5kObABAA--.7496S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFW3ZF1kJF43Aw1UJrW3twc_yoW8CFyxpF
	WkCan8WrWrJrW2gwnIqws3WrnIqrWkKr4xZF9rJa45JFnFkryrKFyFkrZrCFW5Awn5uF1x
	ZF1Fq3Wa9F98AacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
	xGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j10PfUUUUU=



在 2023年06月05日 21:12, bibo, mao 写道:
>
> 在 2023/5/30 09:52, Tianrui Zhao 写道:
>> Implement LoongArch vcpu KVM_ENABLE_CAP ioctl interface.
>>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   arch/loongarch/kvm/vcpu.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
>> index 278fbafc59b4..5a88f815c412 100644
>> --- a/arch/loongarch/kvm/vcpu.c
>> +++ b/arch/loongarch/kvm/vcpu.c
>> @@ -186,6 +186,23 @@ int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
>>   	return 0;
>>   }
>>   
>> +static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
>> +				     struct kvm_enable_cap *cap)
>> +{
>> +	int r = 0;
>> +
>> +	if (!kvm_vm_ioctl_check_extension(vcpu->kvm, cap->cap))
>> +		return -EINVAL;
> It is a little strange to check extension of the whole vm in enable vcap capability.
> can we change to usage like  general architectures?
Thanks, I look up this interface of other archs and re-consider it, and 
I think it should be removed.

Thanks
Tianrui Zhao
>
>> +	if (cap->flags)
>> +		return -EINVAL;
>> +	if (cap->args[0])
>> +		return -EINVAL;
>> +	if (cap->cap)
>> +		return -EINVAL;
> Do we need check args[0] and cap here ?
>
> Regards
> Bibo, Mao
No need, I will remove the two conditions.

Thanks
Tianrui Zhao
>> +
>> +	return r;
>> +}
>> +
>>   long kvm_arch_vcpu_ioctl(struct file *filp,
>>   			 unsigned int ioctl, unsigned long arg)
>>   {
>> @@ -209,6 +226,15 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>>   			r = _kvm_get_reg(vcpu, &reg);
>>   		break;
>>   	}
>> +	case KVM_ENABLE_CAP: {
>> +		struct kvm_enable_cap cap;
>> +
>> +		r = -EFAULT;
>> +		if (copy_from_user(&cap, argp, sizeof(cap)))
>> +			break;
>> +		r = kvm_vcpu_ioctl_enable_cap(vcpu, &cap);
>> +		break;
>> +	}
>>   	default:
>>   		r = -ENOIOCTLCMD;
>>   		break;

