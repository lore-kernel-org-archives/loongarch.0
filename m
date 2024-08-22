Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9963215A8
	for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 01:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724289000; cv=none; b=CGxocBaNZZJvupsjiPeTF8XmhNJWYv3XKO7Koq2dbUsvl0UQA/SUm+ySSH19obGFGRu17tPH1df8w6fvbyBRqM/X5XesQ5pWXzvmBPDpz+gGQxg6MrIx7Vkq8Eqhjcdsd+Y2nZTvZGXV8BwNUtKXb1nPfRKHrXxbQUTuH+q7wEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724289000; c=relaxed/simple;
	bh=qafS7+sBdjv3I7dGrBgxG4xDdtda1/hablsJwC2R42Q=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kUxYlRsgnizGS4vMogWhaj2EgsZYAR7dTpM/vEmb177gwTAC96hFyCUU24/jFXq6MwoDpYcT4jEufwpwKdS3QK55WJCJczmov0qYAhhpIA40Fa+l+Zwqx2sScw8G2IFxDIFGUUyU32J6dewPCvTIS5fcG4uQf4s5DGQRIjnjyv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxXZvej8ZmFLYbAA--.33690S3;
	Thu, 22 Aug 2024 09:09:51 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMBxZODdj8ZmXEcdAA--.62921S3;
	Thu, 22 Aug 2024 09:09:49 +0800 (CST)
Subject: Re: [PATCH v1 2/2] LoongArch: Add ifdefs to fix LSX and LASX related
 issues
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240820123731.31568-1-yangtiezhu@loongson.cn>
 <20240820123731.31568-3-yangtiezhu@loongson.cn>
 <1d23bbfe-dd36-b2ff-c4b3-cf69396ea53f@loongson.cn>
 <882d3aa3-24cf-9866-7e00-161e94893811@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <57818c31-c767-e8f4-2ea9-765e2dbbe1ba@loongson.cn>
Date: Thu, 22 Aug 2024 09:09:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <882d3aa3-24cf-9866-7e00-161e94893811@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxZODdj8ZmXEcdAA--.62921S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr1UAFy7WryxXFW7ur18tFc_yoW8tFy3pr
	97AFWDJrWrCr1kAr1DJw1DWF90yr18J3WUXr1UJFyUJws8Jr4aqr4jgF1jgryUWr48J3WS
	yFW8Xw1avryUJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jepB-UUUUU=



On 2024/8/21 下午6:07, Tiezhu Yang wrote:
> On 08/21/2024 09:12 AM, maobibo wrote:
>>
>>
>> On 2024/8/20 下午8:37, Tiezhu Yang wrote:
>>> There exist some issues when building kernel if CONFIG_CPU_HAS_LBT is 
>>> set
>>> but CONFIG_CPU_HAS_LSX and CONFIG_CPU_HAS_LASX are not set. In this 
>>> case,
>>> there are no definitions of _restore_lsx and _restore_lasx and there are
>>> also no definitions of kvm_restore_lsx and kvm_restore_lasx in fpu.S and
>>> switch.S respectively, just add some ifdefs to fix the issues.
> 
> ...
> 
>> It is hard to understand to put CONFIG_CPU_HAS_LASX inside
>> CONFIG_CPU_HAS_LBT, in general option CONFIG_CPU_HAS_LBT has nothing
>> with CONFIG_CPU_HAS_LASX.
>>
>> Would you like to add parameter func in macro fpu_restore_csr like this?
>>
>> --- a/arch/loongarch/include/asm/asmmacro.h
>> +++ b/arch/loongarch/include/asm/asmmacro.h
>> @@ -55,10 +55,11 @@
>>  #endif
>>         .endm
>>
>> -       .macro fpu_restore_csr thread tmp0 tmp1
>> +       .macro fpu_restore_csr thread tmp0 tmp1 func
>>         ldptr.w         \tmp0, \thread, THREAD_FCSR
>>         movgr2fcsr      fcsr0, \tmp0
>>  #ifdef CONFIG_CPU_HAS_LBT
>> +       STACK_FRAME_NON_STANDARD        \func
>>         /* TM bit is always 0 if LBT not supported */
>>         andi            \tmp0, \tmp0, FPU_CSR_TM
>>         beqz            \tmp0, 2f
>> @@ -282,10 +283,10 @@
>>         lsx_save_data           \thread, \tmp0
>>         .endm
> 
> For the record, I modified the related code as you suggested and tested 
> with various configs, it works well.
> 
> But as we discussed offline, these current changes are small relatively
> and the STACK_FRAME_NON_STANDARD related code may be removed if there
> is a proper possible way, so just leave it as is in my opinion.
Just be curious, what is the proper possible way to remove this, is it 
solved with new gcc/binutil version?  Do we plan to drop latest 
gcc/binutils support in near future only in order to remove these 
STACK_FRAME_NON_STANDARD code?

Regards
Bibo Mao
> 
> Thanks,
> Tiezhu
> 

