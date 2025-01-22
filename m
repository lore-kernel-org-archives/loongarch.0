Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE62B1DFF0
	for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 03:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737515388; cv=none; b=qtHFCLGaUgBRs03bLztMXmndKzclPBMf3s+E2E+QJiCf6pXlBGcWo5Pbq9rD3gsN8igsiSNAhlJE8ot8vzuFD7Eqr+KRUo2PY0Oe+cVq38uI2bbxNg/K91whHpM261OltoUvrgvpzTssVuuGQT3i6z++38XJvtmppy5lNF7eNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737515388; c=relaxed/simple;
	bh=G70SIi6ajQSHx3Tb52Zf4ie9a1dUHmrdN1fFyGxbfBo=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DhAB6PK31l7xLtLD4DTrfqtOGfv8a6+pQhS2SAHKbVgX/CYPZMlLmruNRFjqc5NbiIKUZURichvKBIY1YTyI5DoK6OddMptEsorZM5ZEva7Ra8GpBCLLxcp+HXf/Bd/V9ZzZlXGCmrxiOm7NXlmWiNqUbXT/Kev1m7IBc9Hq8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxnOJoYZBniwdnAA--.9226S3;
	Wed, 22 Jan 2025 11:09:28 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx3sVnYZBnVi4qAA--.16837S3;
	Wed, 22 Jan 2025 11:09:28 +0800 (CST)
Subject: Re: [PATCH 2/2] LoongArch: Extend the maximum number of watchpoints
To: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20250121070617.3214-1-yangtiezhu@loongson.cn>
 <20250121070617.3214-3-yangtiezhu@loongson.cn>
 <75b6fec7-f168-4bc3-9479-8a089bb4e033@xen0n.name>
 <42e64433f3255740292d428cf459959430fdc7e3.camel@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0943c7f0-65e1-e3bf-97e1-10125c46d316@loongson.cn>
Date: Wed, 22 Jan 2025 11:09:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <42e64433f3255740292d428cf459959430fdc7e3.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCx3sVnYZBnVi4qAA--.16837S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxuryrAr17WF4xCr1fAFyktFc_yoWrJFWxpa
	1fKw1xKws8AF4DCw12yay5ur97u3s5JFyrXw1kJryfArn09a4a9340gF9aqayUG348Ka42
	qr1UtF1rta17AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXU
	UUUU=

On 01/21/2025 09:46 PM, Xi Ruoyao wrote:
> On Tue, 2025-01-21 at 21:35 +0800, WANG Xuerui wrote:
>> one cannot account for older (in fact, *every existing*) clients
>> expecting the old UAPI, hence providing a smaller buffer than struct
>> user_watch_state_v2. In which case the kernel will happily write
>> out-of-bounds if the client asks for the current watchpoint state. This
>> is not acceptable I'm afraid.
>
> Yes, many distros support running the latest kernel with an old
> userspace for hardware compatibility reason and the change will blow up
> gdb on all those distros.  We need to do something smarter to retain the
> backward compatibility.

Hi Xuerui and Ruoyao,

The compatibility problem has been considered when developing and testing
the patches, when the applications in the userspace get watchpoint state,
the length will be specified which will not bigger than the sizeof struct
user_watch_state or user_watch_state_v2, the actual length is assigned as
the minimal value of the application and kernel in the generic ptrace:

kernel/ptrace.c: ptrace_regset():

	kiov->iov_len = min(kiov->iov_len,
			            (__kernel_size_t) (regset->n * regset->size));

	if (req == PTRACE_GETREGSET)
		    return copy_regset_to_user(task, view, regset_no, 0,
					                   kiov->iov_len, kiov->iov_base);
	else
		    return copy_regset_from_user(task, view, regset_no, 0,
					                     kiov->iov_len, kiov->iov_base);

For example, there are four kind of combinations, all of them work well.

(1) "older kernel + older gdb", the actual length is 8+(8+8+4+4)*8=200;
(2) "newer kernel + newer gdb", the actual length is 8+(8+8+4+4)*14=344;
(3) "older kernel + newer gdb", the actual length is 8+(8+8+4+4)*8=200;
(4) "newer kernel + older gdb", the actual length is 8+(8+8+4+4)*8=200.

If you have more comments, please let me know.


Hi Huacai,

Could you please update the commit message when applying the patches
if you think the changes are OK? Like this:

----------------------
The maximum number of load/store watchpoints and fetch instruction
watchpoints is 14 each according to LoongArch Reference Manual, so
extend the maximum number of watchpoints from 8 to 14 for ptrace.

By the way, just simply change 8 to 14 for the definition in struct
user_watch_state at the beginning, but it may corrupt uapi, then add
a new struct user_watch_state_v2 directly.

As far as I can tell, the only users for this struct in the userspace
are GDB and LLDB, there are no any problems of software compatibility
between the application and kernel according to the analysis.

The compatibility problem has been considered when developing and testing
the patches, when the applications in the userspace get watchpoint state,
the length will be specified which will not bigger than the sizeof struct
user_watch_state or user_watch_state_v2, the actual length is assigned as
the minimal value of the application and kernel in the generic ptrace:

kernel/ptrace.c: ptrace_regset():

	kiov->iov_len = min(kiov->iov_len,
			            (__kernel_size_t) (regset->n * regset->size));

	if (req == PTRACE_GETREGSET)
		    return copy_regset_to_user(task, view, regset_no, 0,
					                   kiov->iov_len, kiov->iov_base);
	else
		    return copy_regset_from_user(task, view, regset_no, 0,
					                     kiov->iov_len, kiov->iov_base);

For example, there are four kind of combinations, all of them work well.

(1) "older kernel + older gdb", the actual length is 8+(8+8+4+4)*8=200;
(2) "newer kernel + newer gdb", the actual length is 8+(8+8+4+4)*14=344;
(3) "older kernel + newer gdb", the actual length is 8+(8+8+4+4)*8=200;
(4) "newer kernel + older gdb", the actual length is 8+(8+8+4+4)*8=200.
----------------------

Thanks,
Tiezhu

