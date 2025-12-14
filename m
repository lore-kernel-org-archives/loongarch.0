Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA781ACEDF
	for <loongarch@lists.linux.dev>; Sun, 14 Dec 2025 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765715784; cv=none; b=bamMH/AWJleY0BXHDKMMh5QQvQrt3dkIfUYIJYSp8M6FDrTQFG5PLmnD/Q+fdbQ7hfKdCb4tTTYwI40YXa7p6kfm6wAfM8v1/eRaWDQ7G1rEVVnFbl81YmqsDwUGTyZuazJtQ/zZ+MpSazgwSk6P6AxjfdfTqwFVqW+oWvbDDhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765715784; c=relaxed/simple;
	bh=KtSX7xSMDpi8HxduNHgb8hMxv4BwkprSIHnf4t0iwhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VO67D+hqDENMQ1PU749v9zxzoYlv85YxlmKe5wTJRQygAa0f8nHH8xz39tyfBf00RxA8MZ4UsKcF8Z5T4kiWh0YP2GkrTb6EE+oKr12+y1VYgTqtIlN3qmQvkZRNTk/aWvZ8qxBoIesG25apAcf9bEThJtdRmelEKi4c3i7fyck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [117.22.160.58])
	by gateway (Coremail) with SMTP id _____8Axz785rz5plAkuAA--.31574S3;
	Sun, 14 Dec 2025 20:36:09 +0800 (CST)
Received: from [192.168.0.111] (unknown [117.22.160.58])
	by front1 (Coremail) with SMTP id qMiowJDx_8Mzrz5pdD5JAQ--.64818S3;
	Sun, 14 Dec 2025 20:36:07 +0800 (CST)
Message-ID: <c6c385b0-60cf-b0c4-1962-974e783b131a@loongson.cn>
Date: Sun, 14 Dec 2025 20:36:16 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/4] LoongArch: BPF: Enhance trampoline support for
 kernel and module tracing
Content-Language: en-US
To: Chenghao Duan <duanchenghao@kylinos.cn>, hengqi.chen@gmail.com,
 chenhuacai@kernel.org
Cc: kernel@xen0n.name, zhangtianyang@loongson.cn, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, youling.tang@linux.dev, jianghaoran@kylinos.cn,
 vincent.mc.li@gmail.com
References: <20251212091103.1247753-1-duanchenghao@kylinos.cn>
 <20251212091103.1247753-4-duanchenghao@kylinos.cn>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <20251212091103.1247753-4-duanchenghao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJDx_8Mzrz5pdD5JAQ--.64818S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr1fGw1kAFW3AF4UCw18CrX_yoW8Cw1kpa
	yrKF98KFsIgr1jkFs7Gw4xXFyfua9xWrZ8Gr4jqw1rC3Z8Jr1SkF4fKw4Yva48Cr4fC34I
	vr1jyr43K3Z0vFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==

On 12/12/25 17:11, Chenghao Duan wrote:
> This patch addresses two main issues in the LoongArch BPF trampoline
> implementation:
> 
> 1. BPF-to-BPF call handling:
>   - Modify the build_prologue function to ensure that the value of the
>   return address register ra is saved to t0 before entering the
>   trampoline operation.
>   - This ensures that the return address handling logic is accurate and
>   error-free when a BPF program calls another BPF program.
> 
> 2. Enable Module Function Tracing Support:
>   - Remove the previous restrictions that blocked the tracing of kernel
>   module functions.
>   - Fix the issue that previously caused kernel lockups when attempting
>   to trace module functions
> 
> 3. Related Function Optimizations:
>   - Adjust the jump offset of tail calls to ensure correct instruction
>     alignment.
>   - Enhance the bpf_arch_text_poke() function to enable accurate location
>   of BPF program entry points.
>   - Refine the trampoline return logic to ensure that the register data
>   is correct when returning to both the traced function and the parent
>   function.
> 
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>

As described in the commit message, your changes include many kinds
of contents, thanks for the fixes and optimizations.

In order to avoid introducing bugs in the middle, please separate each
logical change into a separate patch, each patch should make an easily
understood change that can be verified by reviewers, each patch should
be justifiable on its own merits.

The current patch #4 can be put after the current patch #2 as a
preparation for the bpf patches.

Furthermore, it would be better to put the related test cases in the
commit message of each patch rather than in the cover letter, so that
it can be verified easily to know what this patch affected and can be
recorded in the git log.

And also please add Fixes tag for each patch if possible.

Thanks,
Tiezhu

