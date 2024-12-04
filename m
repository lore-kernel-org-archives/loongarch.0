Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEB2142E86
	for <loongarch@lists.linux.dev>; Wed,  4 Dec 2024 03:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733284744; cv=none; b=GP5utRy5ATLg4LXbha43xL5HriLY7l0C5zHgLz7qK6ptiB0uF1rAq+urI4JPosLxG/VYnwoQ+AC1DRscFV2nNh4DO+PPNIyk9oJ/ym/k5/EcT3B8+a+hDF3xgDeQF4apY4YYulb7TyyjdHLHGuKQe0lOcPQEIYDmo2hWIRvrlrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733284744; c=relaxed/simple;
	bh=5Zu0i0HD/f0tjB+TrF1WgwVUWI+7cgyj9N9PMr50iWA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CpmEZvxFQUWVhJegQuuym3yiQKE7+RlmRJ7+tKcU+p2h650TaTTk0n683my8uIeea/i+Q6aZDRAZVjVYr5uGVN7BXndQ7n1fiNwqpITWK9mj+28zR7/HMxwjekKwLW+Lzih5HGFs3JsuETzticWEoFLqro+sXrZDGz65IPiMJ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxIK+C009n_mNQAA--.1132S3;
	Wed, 04 Dec 2024 11:58:58 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMBxJMCA009nfAJ1AA--.59317S3;
	Wed, 04 Dec 2024 11:58:57 +0800 (CST)
Subject: Re: [RFC 5/5] LoongArch: KVM: Enable separate vmid feature
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241113031727.2815628-1-maobibo@loongson.cn>
 <20241113031727.2815628-6-maobibo@loongson.cn>
 <CAAhV-H54WbE_6CM8L3q_jRjA_VXLqX_msEmzOmwy2s0dFABCgw@mail.gmail.com>
From: bibo mao <maobibo@loongson.cn>
Message-ID: <f0f1f709-9ae0-3b7e-a074-94538e4c3d89@loongson.cn>
Date: Wed, 4 Dec 2024 11:58:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H54WbE_6CM8L3q_jRjA_VXLqX_msEmzOmwy2s0dFABCgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxJMCA009nfAJ1AA--.59317S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZFWktr4fJr1DuryDKr45Arc_yoW5Gr1xpr
	W7AF98JrWv9r93Gwn0qwnYqr15X342g3W2qFn2qryfursIgFWvyF1kK34DZF1rWw4FyFyv
	9r1vy39IvFsFyacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xu
	ctUUUUU==



On 2024/12/3 上午10:48, Huacai Chen wrote:
> Hi, Bibo,
> 
> I think you need to probe LOONGARCH_CPU_GUESTID at the end of
> cpu_probe_common(), otherwise cpu_has_guestid is always false.
yes, it is always false now.
Will negotiate with HW guys and add real probe mechanism.

Regards
Bibo Mao
> 
> Huacai
> 
> On Wed, Nov 13, 2024 at 11:17 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> With CSR GTLBC shortname for Guest TLB Control Register, separate vmid
>> feature will be enabled if bit 14 CSR_GTLBC_USEVMID is set. Enable
>> this feature if cpu_has_guestid is true when KVM module is loaded.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/loongarch.h | 2 ++
>>   arch/loongarch/kvm/main.c              | 4 +++-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
>> index 64ad277e096e..5fee5db3bea0 100644
>> --- a/arch/loongarch/include/asm/loongarch.h
>> +++ b/arch/loongarch/include/asm/loongarch.h
>> @@ -326,6 +326,8 @@
>>   #define  CSR_GTLBC_TGID_WIDTH          8
>>   #define  CSR_GTLBC_TGID_SHIFT_END      (CSR_GTLBC_TGID_SHIFT + CSR_GTLBC_TGID_WIDTH - 1)
>>   #define  CSR_GTLBC_TGID                        (_ULCAST_(0xff) << CSR_GTLBC_TGID_SHIFT)
>> +#define  CSR_GTLBC_USEVMID_SHIFT       14
>> +#define  CSR_GTLBC_USEVMID             (_ULCAST_(0x1) << CSR_GTLBC_USEVMID_SHIFT)
>>   #define  CSR_GTLBC_TOTI_SHIFT          13
>>   #define  CSR_GTLBC_TOTI                        (_ULCAST_(0x1) << CSR_GTLBC_TOTI_SHIFT)
>>   #define  CSR_GTLBC_USETGID_SHIFT       12
>> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
>> index f89d1df885d7..50c977d8b414 100644
>> --- a/arch/loongarch/kvm/main.c
>> +++ b/arch/loongarch/kvm/main.c
>> @@ -336,7 +336,7 @@ int kvm_arch_enable_virtualization_cpu(void)
>>          write_csr_gcfg(0);
>>          write_csr_gstat(0);
>>          write_csr_gintc(0);
>> -       clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI);
>> +       clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI | CSR_GTLBC_USEVMID);
>>
>>          /*
>>           * Enable virtualization features granting guest direct control of
>> @@ -359,6 +359,8 @@ int kvm_arch_enable_virtualization_cpu(void)
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

