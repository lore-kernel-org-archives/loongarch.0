Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF7FE571
	for <loongarch@lists.linux.dev>; Sat,  2 Aug 2025 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126360; cv=none; b=TgMxfZ7nplqGS2hDqZcTj3TXiQf25SN/A0itFFZpygQ1YNUsZFnbGB+mJefhCrXgKb/w03dOqmk7Ei5FhYnfcJmVkJ/erpOgrjfjR3zxqRbQ6Ff6AYT9gi5VKpkcbnsIpWareiYyntlgrZ8PVhDQUnJ/L8Pay/A5xjdeMTi5VRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126360; c=relaxed/simple;
	bh=QHPiuFf9FIAvZsIXnfqQ7FZaiuJZqVnyac5isXKsqfc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WAVv2JQt9K1LGLx10bZtykYp6QvNjGEUUROBWCXYK1m6yv4GbFjXqUEMmvgXYTYJhlc9MO6xn/iUPIEZg43QNjR1m7F81jKPkp6HIUFBXAxPuLtmhiqcg2yTHzDZFvECfpCeW1PffZUvSg5k/zFBcdjldseKRxe8ztgpqtB5N+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxaWoM2I1ogkE3AQ--.47941S3;
	Sat, 02 Aug 2025 17:19:08 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxH8IJ2I1o0jIyAA--.64402S3;
	Sat, 02 Aug 2025 17:19:06 +0800 (CST)
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Vincent Li <vincent.mc.li@gmail.com>,
 Chenghao Duan <duanchenghao@kylinos.cn>
Cc: hengqi.chen@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, guodongtai@kylinos.cn, youling.tang@linux.dev,
 jianghaoran@kylinos.cn, geliang@kernel.org
References: <20250730131257.124153-1-duanchenghao@kylinos.cn>
 <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <84789726-18a6-b46f-3ece-f887599ccf4a@loongson.cn>
Date: Sat, 2 Aug 2025 17:19:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxH8IJ2I1o0jIyAA--.64402S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKw47WF4DuF4xXFy3CFW8Xwc_yoWkAwc_Jr
	ZrK3Wjkr4jqF47uF4Iqr4rX39rC3yrWr1kJr18WF9xX3yxKFW3Jrn7Gr129w4YqFn3GrZF
	va1kCFW7Zr1a9osvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUba8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8VwZ7UUUUU==

On 2025/8/1 下午1:21, Vincent Li wrote:
> Hi Chenghao,
> 
> I trimmed the email recipients only to the loongarch mailing list and
> folks who might pay attention to this, I personally don't like to
> bother other people who may not be interested in this :). Folks let me
> know if this  is not ok. anyway, please check my bpf selftest result
> inline.  The fentry_attach_stress results in kernel lockup.

It passed on my test environment.

   $ sudo ./test_progs -a fentry_attach_stress
   #104     fentry_attach_stress:OK
   Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

I used loongson3_defconfig and the following additional configs:

CONFIG_KPROBES=y
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_TEST_BPF=m
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_FPROBE=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
CONFIG_DEBUG_INFO_BTF=y
CONFIG_NET_SCH_BPF=y
CONFIG_BPF_LSM=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=n
CONFIG_ARCH_STRICT_ALIGN=n

I am not sure whether it is related with configs, you can test it again.

Thanks,
Tiezhu

