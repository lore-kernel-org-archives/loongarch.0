Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D0422423A
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020951; cv=none; b=XuZie3oJHkehxAuovn23YVtcXwZ4mu/nXHUPCu/4Hg+UafgwHCISdSebK1UXmm0+Us2dPm/6+Mkzr7IAQQfj3GDtlFS+7DqHQPSZIzfhFSTCVf3N0OvmANq3Z9IfIAqHCvIOusUegpGohVmX5oTgPEnbVHINEZzbyVIgC2wl/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020951; c=relaxed/simple;
	bh=Zst489Id8XlIVDJUcBN3aY+wige+2/itL+QAeIOG1yc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kch/+M+WXjrtjdNlPXDjbU4FEMZ0d9KZK1+ZSgT4dqapeanohYc/W5ZuN9aZeP/w8Bauc4VduCACcgrnyMvSfCCOuMbpfsXicMl18Isn3nA1atbL+XRqYwkplkgMpD5egqfLRgqtP4ltcf2V7pFuZJghYgCWmcLtDdsQCrct4Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxOqFKhHRqpP0KAA--.12070S3;
	Thu, 06 Aug 2026 20:55:38 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxDcdIhHRqEM4lAA--.7143S2;
	Thu, 06 Aug 2026 20:55:38 +0800 (CST)
Subject: Re: [PATCH v2 5/5] LoongArch: KVM: Enable separate vmid feature
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
 Arnd Bergmann <arnd@arndb.de>, Xi Ruoyao <xry111@xry111.site>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260806020739.2149268-1-maobibo@loongson.cn>
 <20260806020739.2149268-6-maobibo@loongson.cn>
 <CAAhV-H6cTtqzCGfr5aZNgpPBpG1YLkmZ9axq45ViAf2_x69fjg@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <ae64693c-0c99-9de9-c4d9-ed5ab6e55506@loongson.cn>
Date: Thu, 6 Aug 2026 20:55:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6cTtqzCGfr5aZNgpPBpG1YLkmZ9axq45ViAf2_x69fjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxDcdIhHRqEM4lAA--.7143S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZrWUuFyDZr4UKw43Aw1DurX_yoWrJFWkpr
	yUAF9rJrWUuryfG3Z0qwnYvr98Xws2g3W2gFn7ta4SyFnIgFW8tF1kK3sxWF15Ww4Fyry0
	9rnY9FsIvFZFy3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5
	JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07josjUUUUUU=



On 2026/8/6 下午8:39, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Thu, Aug 6, 2026 at 10:15 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> With CSR GTLBC shortname for Guest TLB Control Register, separate vmid
>> feature will be enabled if bit 14 CSR_GTLBC_USEVMID is set. Enable
>> this feature if cpu_has_guestid is true when LVZ is enabled and the LVZ
>> version is 2.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/loongarch.h | 5 +++++
>>   arch/loongarch/kernel/cpu-probe.c      | 6 ++++++
>>   arch/loongarch/kvm/main.c              | 4 +++-
>>   3 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
>> index 2a6bc99177d8..a20fb68d8ac4 100644
>> --- a/arch/loongarch/include/asm/loongarch.h
>> +++ b/arch/loongarch/include/asm/loongarch.h
>> @@ -138,6 +138,9 @@
>>   #define  CPUCFG6_PMBITS_SHIFT          8
>>   #define  CPUCFG6_UPM                   BIT(14)
>>
>> +#define LOONGARCH_CPUCFG8              0x8
>> +#define  CPUCFG8_VMID                  BIT(8)
>> +
>>   #define LOONGARCH_CPUCFG16             0x10
>>   #define  CPUCFG16_L1_IUPRE             BIT(0)
>>   #define  CPUCFG16_L1_IUUNIFY           BIT(1)
>> @@ -350,6 +353,8 @@
>>   #define  CSR_GTLBC_TGID_WIDTH          8
>>   #define  CSR_GTLBC_TGID_SHIFT_END      (CSR_GTLBC_TGID_SHIFT + CSR_GTLBC_TGID_WIDTH - 1)
>>   #define  CSR_GTLBC_TGID                        (_ULCAST_(0xff) << CSR_GTLBC_TGID_SHIFT)
>> +#define  CSR_GTLBC_USEVMID_SHIFT       14
>> +#define  CSR_GTLBC_USEVMID             (_ULCAST_(0x1) << CSR_GTLBC_USEVMID_SHIFT)
> 
> Other fields in GTLBC is TGID, so it is better to name it
> CSR_GTLBC_USETGID, just use vpid/vmid for software purely.
  - clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI);
  + clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI | CSR_GTLBC_USEVMID);

There is CSR_GTLBC_USETGID enabled already which it bit 12 :)

> 
> 
> 
> Huacai
> 
>>   #define  CSR_GTLBC_TOTI_SHIFT          13
>>   #define  CSR_GTLBC_TOTI                        (_ULCAST_(0x1) << CSR_GTLBC_TOTI_SHIFT)
>>   #define  CSR_GTLBC_USETGID_SHIFT       12
>> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
>> index 74d31f260dfd..fc68f695d49c 100644
>> --- a/arch/loongarch/kernel/cpu-probe.c
>> +++ b/arch/loongarch/kernel/cpu-probe.c
>> @@ -241,6 +241,12 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
>>          if (config & CPUCFG6_PMP)
>>                  c->options |= LOONGARCH_CPU_PMP;
>>
>> +       if (c->options & LOONGARCH_CPU_LVZ) {
>> +               config = read_cpucfg(LOONGARCH_CPUCFG8);
>> +               if (config & CPUCFG8_VMID)
>> +                       c->options |= LOONGARCH_CPU_GUESTID;
>> +       }
>> +
>>          config = csr_read32(LOONGARCH_CSR_ASID);
>>          config = (config & CSR_ASID_BIT) >> CSR_ASID_BIT_SHIFT;
>>          asid_mask = GENMASK(config - 1, 0);
>> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
>> index 72c1d23156e5..712b078db0d5 100644
>> --- a/arch/loongarch/kvm/main.c
>> +++ b/arch/loongarch/kvm/main.c
>> @@ -359,7 +359,7 @@ int kvm_arch_enable_virtualization_cpu(void)
>>          write_csr_gcfg(0);
>>          write_csr_gstat(0);
>>          write_csr_gintc(0);
>> -       clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI);
>> +       clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI | CSR_GTLBC_USEVMID);
>>
>>          /*
>>           * Enable virtualization features granting guest direct control of
>> @@ -382,6 +382,8 @@ int kvm_arch_enable_virtualization_cpu(void)
>>
>>          /* Enable using TGID  */
>>          set_csr_gtlbc(CSR_GTLBC_USETGID);
>> +       if (cpu_has_guestid)
>> +               set_csr_gtlbc(CSR_GTLBC_USEVMID);
>>          kvm_debug("GCFG:%lx GSTAT:%lx GINTC:%lx GTLBC:%lx",
>>                    read_csr_gcfg(), read_csr_gstat(), read_csr_gintc(), read_csr_gtlbc());
>>
>> --
>> 2.39.3
>>

