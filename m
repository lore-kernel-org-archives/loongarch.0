Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E763B27FA
	for <loongarch@lists.linux.dev>; Wed, 23 Sep 2026 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145751; cv=none; b=iiQQvf0vf7Dt7cidlIvZDogsccfzOzUZLgi26iFKDp2kaNjkTPil4kbbgSFsYNTRQ4VrmtgvrbM7wgr8w7LJhF4Tcb7FgRUX33B/WfGlb/4+OX3GTuyvJEA87wlWnQag/1fAi2fuZiYunyNoZmTnChRSjUCIx00r5C+V+Sv/H5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145751; c=relaxed/simple;
	bh=Z3gPbuK5qepuqx2fCRdB3pvyPoSFEwvQ7ryb6Thvrxs=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=l/EuDgRcz4NW/R4e5Y/AQj8YtdNaQ/plNw2ryoUB5cGU+qstg0XHZlHpbLKwYNumeP0vT0y8F4OZ6c3phD2npM/Ov7eHE6+v4srtnKHgMiK3klv9vpxev5RFYzVvACyrAeGkNXRoyi3akFo23XVTNpQcMYVkb68f0pBTV2AS/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxHNLPdLNqT_EOAA--.43738S3;
	Wed, 23 Sep 2026 14:42:23 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxlMzMdLNqOBckAA--.49011S2;
	Wed, 23 Sep 2026 14:42:22 +0800 (CST)
Subject: Re: [PATCH] KVM: LoongArch: selftests: Enable HW PTW by auto
 detection method
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923012356.1058379-1-maobibo@loongson.cn>
 <CAAhV-H4AvjyfmjPiUBxBsWjRNFpP5c4sWK0+ZH-e1gjtrxBhMg@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <0b746444-df7f-1edd-8fd0-1736c96ac366@loongson.cn>
Date: Wed, 23 Sep 2026 14:43:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4AvjyfmjPiUBxBsWjRNFpP5c4sWK0+ZH-e1gjtrxBhMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxlMzMdLNqOBckAA--.49011S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF47Aw4fWryxAr18ArW7ZFc_yoWrXF17pF
	yvkF4Ygr48KF17Ka4kXwn09F1aqrs2kr4xKry3trZ0yr1UZryfXryxKF9xuFy5XwsYq3WS
	v3Z7Ca13ZF4DX3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8HS
	oJUUUUU==



On 2026/9/23 下午12:25, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Wed, Sep 23, 2026 at 9:31 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> Add HW PTW feature when VM is created. This feature is detected firstly,
>> enable it if it is available on host machine. With HW PTW feature enabled,
>> refill exception will not happen and it is not necessary to set refill
>> exception entry.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   .../selftests/kvm/include/loongarch/processor.h  |  3 +++
>>   .../selftests/kvm/lib/loongarch/processor.c      | 16 ++++++++++++++--
>>   2 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/include/loongarch/processor.h b/tools/testing/selftests/kvm/include/loongarch/processor.h
>> index 0e59daa8024e..8d9fabdc89e3 100644
>> --- a/tools/testing/selftests/kvm/include/loongarch/processor.h
>> +++ b/tools/testing/selftests/kvm/include/loongarch/processor.h
>> @@ -79,6 +79,7 @@
>>   #define  CPUCFG2_LASX                  BIT(7)
>>   #define  CPUCFG2_LLFTP                 BIT(14)
>>   #define  CPUCFG2_LLFTPREV              GENMASK(17, 15)
>> +#define  CPUCFG2_PTW                   BIT(24)
>>
>>   /* LoongArch Basic CSR registers */
>>   #define LOONGARCH_CSR_CRMD             0x0 /* Current mode info */
>> @@ -128,6 +129,8 @@
>>   #define LOONGARCH_CSR_PGD              0x1b
>>   #define LOONGARCH_CSR_PWCTL0           0x1c
>>   #define LOONGARCH_CSR_PWCTL1           0x1d
>> +#define  CSR_PWCTL1_PTW_SHIFT          24
>> +#define  CSR_PWCTL1_PTW                        BIT_ULL(CSR_PWCTL1_PTW_SHIFT)
>>   #define LOONGARCH_CSR_STLBPGSIZE       0x1e
>>   #define LOONGARCH_CSR_CPUID            0x20
>>   #define LOONGARCH_CSR_KS0              0x30
>> diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
>> index 47bbde3e205a..35e35c62759f 100644
>> --- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
>> +++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
>> @@ -282,6 +282,7 @@ void loongarch_vcpu_setup(struct kvm_vcpu *vcpu)
>>          unsigned int cfg;
>>          unsigned long val;
>>          struct kvm_vm *vm = vcpu->vm;
>> +       bool has_ptw = false;
>>
>>          switch (vm->mode) {
>>          case VM_MODE_P36V47_16K:
>> @@ -300,6 +301,12 @@ void loongarch_vcpu_setup(struct kvm_vcpu *vcpu)
>>          ret = __kvm_has_device_attr(vm->fd, KVM_LOONGARCH_VM_FEAT_CTRL, KVM_LOONGARCH_VM_FEAT_LASX);
>>          if (!ret)
>>                  cfg |= CPUCFG2_LASX;
>> +       ret = __kvm_has_device_attr(vm->fd, KVM_LOONGARCH_VM_FEAT_CTRL, KVM_LOONGARCH_VM_FEAT_PTW);
>> +       if (!ret) {
>> +               cfg |= CPUCFG2_PTW;
>> +               has_ptw = true;
>> +       }
>> +
>>          loongarch_set_cpucfg(vcpu, LOONGARCH_CPUCFG2, cfg);
>>          cfg = read_cpucfg(LOONGARCH_CPUCFG6);
>>          loongarch_set_cpucfg(vcpu, LOONGARCH_CPUCFG6, cfg);
>> @@ -338,6 +345,9 @@ void loongarch_vcpu_setup(struct kvm_vcpu *vcpu)
>>
>>          /* PGD page shift and width */
>>          val = (vm->page_shift + width * (vm->mmu.pgtable_levels - 1)) | width << 6;
>> +       if (has_ptw)
>> +               val |= CSR_PWCTL1_PTW;
>> +
>>          loongarch_set_csr(vcpu, LOONGARCH_CSR_PWCTL1, val);
>>          loongarch_set_csr(vcpu, LOONGARCH_CSR_PGDL, vm->mmu.pgd);
>>
>> @@ -345,8 +355,10 @@ void loongarch_vcpu_setup(struct kvm_vcpu *vcpu)
>>           * Refill exception runs on real mode
>>           * Entry address should be physical address
>>           */
>> -       val = addr_gva2gpa(vm, (unsigned long)handle_tlb_refill);
>> -       loongarch_set_csr(vcpu, LOONGARCH_CSR_TLBRENTRY, val);
>> +       if (!has_ptw) {
> Why not just check CPUCFG2_PTW in cfg? In this way we can drop has_ptw.
Variable cfg is overwritten by the later sentence
  cfg = read_cpucfg(LOONGARCH_CPUCFG6);

> 
> Huacai
> 
>> +               val = addr_gva2gpa(vm, (unsigned long)handle_tlb_refill);
>> +               loongarch_set_csr(vcpu, LOONGARCH_CSR_TLBRENTRY, val);
>> +       }
>>
>>          /*
>>           * General exception runs on page-enabled mode
>>
>> base-commit: 93f51579e7df248780214094418f205253383cc5
>> --
>> 2.39.3
>>

