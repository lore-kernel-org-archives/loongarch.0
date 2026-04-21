Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971FE3D6CDA
	for <loongarch@lists.linux.dev>; Tue, 21 Apr 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779171; cv=none; b=FnRcRD3NDn/B6A/3sc6ytDEtqn++cO/oIh9inl8bL2OpPUWF00qKGju+CVRxqDTszoJa/HPsTxBjdx+5xjwoTWgB9vrEGjpX2gyf2Aa+7C4bbEuwFCvZvmDTUGTqXLK9WFr2OYHkJcPjjYiWzLn1+N/xOUZMtg+KQEAi3NT6ZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779171; c=relaxed/simple;
	bh=tAhlvqyO+FZZSHVFcQmYi9w62g33KA8GF4U40atYtqk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MEUpTpKf7+13rqrWsnZCebn4GXPwaW5pwmlatH958kpZKKYBT/vA+mMfBY9YNhFdSVNPBxSSQ8EMmCtXocbFAQTxjsR4bItOj3DaGJQbpIbyz3cBkUr19YijMNe07gAjitW8SWOnHdZ3rxkw7sJgXiwEc4xgiSNPyDxbeRda3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [117.22.85.157])
	by gateway (Coremail) with SMTP id _____8Dx8eqef+dp_n0CAA--.9198S3;
	Tue, 21 Apr 2026 21:46:06 +0800 (CST)
Received: from [192.168.0.111] (unknown [117.22.85.157])
	by front1 (Coremail) with SMTP id qMiowJDxC8Kcf+dpcQByAA--.18712S3;
	Tue, 21 Apr 2026 21:46:06 +0800 (CST)
Message-ID: <db1df5cf-40a8-2968-7f58-fdd6ec367032@loongson.cn>
Date: Tue, 21 Apr 2026 21:46:56 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 0/5] LoongArch: BPF: Support more atomic instructions
Content-Language: en-US
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260413040506.26640-1-yangtiezhu@loongson.cn>
 <CAAhV-H59RuXDEqLe7UNDYssvMFXqZ2YZuW4gOUqdscPQZpqibg@mail.gmail.com>
 <4a6c89b6-72a8-a80b-1f7c-9a620ed24505@loongson.cn>
In-Reply-To: <4a6c89b6-72a8-a80b-1f7c-9a620ed24505@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJDxC8Kcf+dpcQByAA--.18712S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7urW3WFyUuF18XrW8KFWUWrX_yoW8Jw15pa
	1xta13trsrA3s8uFsFy3Wxua4rtF93X3s8Kr4rGw4xCw45Wr9Ykr4xWF1qkF98WwsYq34f
	Zw4Iqas5JryDu3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==

On 4/21/26 21:25, Tiezhu Yang wrote:
> On 4/21/26 20:38, Huacai Chen wrote:
>> Hi, Tiezhu,
>>
>> Maybe we need V4? If so, please submit as soon as possible.
> 
> For now, TBH, I do not want to do that.
> 
> Patch #1 is OK.
> 
> Patch #2 is OK.
> 
> Patch #3 is OK according to Wang Rui's reply.
> 
> Patch #4 has no big problems, the current testcases passed,
> I am not sure whether it has problem, I can fix it if there
> is a real problem, maybe it needs to update the testcase first.
> 
> patch #5 is OK, hope you can replace "usable" with "enable" in
> the patch subject and commit message when applying.

For patch #5, correct myself, enable is verb, usable is adjective,
so just keep it as is, or modify the log as following:

---
selftests/bpf: Enable CAN_USE_LOAD_ACQ_STORE_REL for LoongArch

In order to do the following load-acquire and store-release tests
on LoongArch:

   sudo ./test_progs -t verifier_load_acquire
   sudo ./test_progs -t verifier_store_release
   sudo ./test_progs -t verifier_precision/bpf_load_acquire
   sudo ./test_progs -t verifier_precision/bpf_store_release
   sudo ./test_progs -t compute_live_registers/atomic_load_acq_store_rel

it needs to enable CAN_USE_LOAD_ACQ_STORE_REL for LoongArch.
---

For short, replace "make ... usable" with "enable ...".

Thanks,
Tiezhu

