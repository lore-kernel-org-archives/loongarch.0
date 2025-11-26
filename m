Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF61219A86
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764137318; cv=none; b=JZk/ZefsKedWoibmfJTQSM8svLgqZ7raxRbDdALni8hnLhwWt1qD8HIMCvMxLHMiDRuFpYBJ3mxIQ+3vrGB1Ygap8od4e6jGZip1C32lB2XQ8wRnsqwKrA1XpUr0T5BZzJ0N/29vMaBZYSfEbgZGKFMUGJB+cR5S4mWSSgHVS5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764137318; c=relaxed/simple;
	bh=a/jteK/x53ZAMtIlz1rqWkW9PR5lU7GMQ1oRMBb1b0g=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Rv3UvJmfy3fQvPOC6upnpfcTtqTIzhTWx2HtGKLnTuSbs0q/c+sS84a1Ddp40it+0DUmO+nrs6u7Cg7Lo/+Nwz/E7EeAid5k9Z+2bQFR7nXmAA5RChyd/TfHNlbigLxXXp/yoJndNBxb3sC1xtxLhs927vbUjhblraH59wZcafA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxrtNcmSZpvTIoAA--.16171S3;
	Wed, 26 Nov 2025 14:08:28 +0800 (CST)
Received: from [10.130.40.41] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxicBbmSZppbs_AQ--.19491S3;
	Wed, 26 Nov 2025 14:08:28 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Jinyang He <hejinyang@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
Date: Wed, 26 Nov 2025 14:08:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxicBbmSZppbs_AQ--.19491S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF18XrWrGrykWrWrWw1ktFc_yoW8Wr15pF
	W7Ar4YyrWkGF1Fqw1qkws5XryrZa9rGa42qrs3K3s8ur13ZF1fXr48Cw1Uuayqv392qa1a
	vFyftr9Y9a4DA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnI
	WIevJa73UjIFyTuYvjxU25EfUUUUU

On 2025/11/25 下午6:52, Jinyang He wrote:
> On 2025-11-25 14:33, Tiezhu Yang wrote:
> 
>> When running virtual machine before testing the kernel live patching with
>> "modprobe livepatch-sample", there is a timeout over 15 seconds, the 
>> dmesg
>> command shows "unreliable stack" for user tasks in debug mode.
>>
>> The "unreliable stack" is because it can not unwind from 
>> kvm_handle_exit()
>> to its previous frame kvm_exc_entry() due to the PC is not a valid kernel
>> address, the root cause is that the code of kvm_exc_entry() was copied to
>> the DMW area in kvm_loongarch_env_init(), so it should check the PC range
>> and then finish unwinding for this special case.
> 
> Hi, Tiezhu,
> 
> Since kvm_loongarch_env_init copies kvm_exc_entry which similar to how
> trap_init copies the exception handler. We should apply the same
> offset-based adjustment to compute the shadow PC address:
>   shadow_pc = kvm_exc_entry + (cur_pc − copied_base_address)
> This allows the ORC unwinder to correctly locate the corresponding 
> unwind info.

Thank you. I did some tests, it can unwind from kvm_handle_exit()
to its previous frame kvm_exc_entry() only when CONFIG_KVM=y,
but it can not unwind from kvm_handle_exit() to its previous frame 
kvm_exc_entry() when CONFIG_KVM=m because we can not get the two
kvm address (unsigned long)kvm_exc_entry and
(unsigned long)kvm_loongarch_ops->exc_entry
in arch/loongarch/kernel/unwind_orc.c.

The KVM team will provide a patch to do something, then I will
test it again.

Thanks,
Tiezhu

