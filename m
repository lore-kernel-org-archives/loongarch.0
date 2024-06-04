Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2E813D609;
	Tue,  4 Jun 2024 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502951; cv=none; b=t4KoNVHznRzoI+Q5DxZMDqy1DQrJeOr+e7TRD1hAquZ1QAObuv4UZWfx5EJga0SD/NqIM3QUtLxBj5237Q66bXvhXodpD8+tBeCqAjeUEyW3/IMuzgobvLN9iXK0RAS2LBTaX3R8oI+WbgLD5HLKUmMDUx434bFk4r4gCvtXBLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502951; c=relaxed/simple;
	bh=+k+b/S9ZcfmjpMWqx+iwUe6kA3vrmV+rrjz+C5Mrwoc=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=czm8t85vQ/1tB6AlbwkvQZ/rXjt6vb9avjNtNYWivTII7UZstZqRqu6cpkSTB07NlR618I6hVmH1IUzS1cshqR4PLRHpm+ZLOsR9L9mXNQA7QTrpDMYTdFyZlAZ4JGLvHSWEifDqD6/lEdd5aECMLpG05AcbISw9hLj6z7wFnkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxP_DfA19mw2ADAA--.14443S3;
	Tue, 04 Jun 2024 20:09:03 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxbcfeA19mWDcUAA--.50980S3;
	Tue, 04 Jun 2024 20:09:03 +0800 (CST)
Subject: Re: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <202405300545.mVqyyvyr-lkp@intel.com>
 <87ttiamkf4.fsf@jogness.linutronix.de> <Zl5m1ZlVmGKitAof@yujie-X299>
 <8690e36c-5fce-5f87-be9b-edc30248167f@loongson.cn>
 <20240604100343.0ZkQ9UcU@linutronix.de>
Cc: Yujie Liu <yujie.liu@intel.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, John Ogness <john.ogness@linutronix.de>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <6ee23ccb-b45e-7f0d-f450-9e023750126e@loongson.cn>
Date: Tue, 4 Jun 2024 20:09:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240604100343.0ZkQ9UcU@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8CxbcfeA19mWDcUAA--.50980S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWrZw18Aw4kXF1kuw1UKF13KFX_yoW8JF4Upr
	1xAF4ktrWkGF1ftF4qy3ykWrWkKFnrGrW2gF1jkFy8ArZrZry0vr1ktryDuFWDZ39xJry0
	vr9agFnIqF47G3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1Ek
	sDUUUUU==



On 06/04/2024 06:03 PM, Sebastian Andrzej Siewior wrote:
> On 2024-06-04 17:49:35 [+0800], Tiezhu Yang wrote:
>> Like this:
>>
>> diff --git a/arch/loongarch/configs/loongson3_defconfig
>> b/arch/loongarch/configs/loongson3_defconfig
>> index b4252c357c8e..0eb14e9259c2 100644
>> --- a/arch/loongarch/configs/loongson3_defconfig
>> +++ b/arch/loongarch/configs/loongson3_defconfig
>> @@ -983,4 +983,3 @@ CONFIG_DEBUG_FS=y
>>  CONFIG_SCHEDSTATS=y
>>  # CONFIG_DEBUG_PREEMPT is not set
>>  # CONFIG_FTRACE is not set
>> -CONFIG_UNWINDER_ORC=y
>
> If ORC/objtool is broken on loongarch, shouldn't you disable it then or
> mask at least via
>
> diff --git a/arch/loongarch/Kconfig.debug b/arch/loongarch/Kconfig.debug
> index 98d60630c3d4b..2bce03b8f8309 100644
> --- a/arch/loongarch/Kconfig.debug
> +++ b/arch/loongarch/Kconfig.debug
> @@ -28,6 +28,7 @@ config UNWINDER_PROLOGUE
>
>  config UNWINDER_ORC
>  	bool "ORC unwinder"
> +	depends on BROKEN
>  	select OBJTOOL
>  	help
>  	  This option enables the ORC (Oops Rewind Capability) unwinder for
>
> instead? Removing it from defconfig makes it still available to to
> randconfig.

Yes, good suggestion, I think so.
Let us wait for more comments.

Thanks,
Tiezhu

