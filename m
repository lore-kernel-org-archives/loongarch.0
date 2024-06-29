Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46B342ABA
	for <loongarch@lists.linux.dev>; Sat, 29 Jun 2024 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719665294; cv=none; b=t6vDgHNElXA2qVPFMBc5iKbSM+2/kOuQQvWC71u1OnAquNfmMC21ysd9wPGGmfNduyWQHdn64pQbDm57z9HhTn9B9hmq54XG78wLe/tnTef+OE/EzYYMFxFt3x3od3t6P9nVF/Q7dCrQ+suFgnLMUF8pTPQZW8Zg9G2wvglXB08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719665294; c=relaxed/simple;
	bh=eksxv3soLqwNNaIwyq6qM/uW+C8SEtvfywK/NPtrcUY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Jd/Q33samNtdKkvXu1Pws4ORv+G51tiltnnj5rOKz9KGa0iN1N6xH53IhE4umk4QLID22OmzFILDurdXNaDguToUCp6MWc3GaatmKZ2AeunOsRUH02bg/V1WOOmyPPfLBKHdYpHqXoBxczqwxCaqIwrke4MoWqEDm0BN+p5A7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [36.44.122.216])
	by gateway (Coremail) with SMTP id _____8DxyLmAAoBmCG8LAA--.1002S3;
	Sat, 29 Jun 2024 20:48:00 +0800 (CST)
Received: from [192.168.0.109] (unknown [36.44.122.216])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx68Z+AoBmIVk1AA--.59448S3;
	Sat, 29 Jun 2024 20:48:00 +0800 (CST)
Message-ID: <37f79351-a051-3fa9-7bfb-960fb2762e27@loongson.cn>
Date: Sat, 29 Jun 2024 20:48:02 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: oleg@redhat.com
Cc: andrii.nakryiko@gmail.com, andrii@kernel.org, bpf@vger.kernel.org,
 chenhuacai@kernel.org, jolsa@kernel.org, kernel@xen0n.name,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, mhiramat@kernel.org, nathan@kernel.org,
 rostedt@goodmis.org, yangtiezhu@loongson.cn
References: <20240627173806.GC21813@redhat.com>
Subject: Re: [PATCH] LoongArch: uprobes: make
 UPROBE_SWBP_INSN/UPROBE_XOLBP_INSN constant
Content-Language: en-US
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <20240627173806.GC21813@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Cx68Z+AoBmIVk1AA--.59448S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFyxGF48CFyxuw18trWUGFX_yoW3Kwc_uw
	sxCay8J348Cr40qFn2y3s3Zw4DWF4xWFW5Xr97Zwn7J34UK3WDZ3yFgrn7Za4rKF40gFsI
	9FZ0qa48Zr1avosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUU
	U

On Thu, 27 Jun 2024 19:38:06 +0200
Oleg Nesterov <oleg@redhat.com> wrote:

...

 > > > +arch_initcall(check_emit_break);
 > > > +
 > >
 > > I wouldn't even bother with this, but whatever.
 >
 > Agreed, this looks a bit ugly. I did this only because I can not test
 > this (hopefully trivial) patch and the maintainers didn't reply.

The LoongArch maintainer Huacai told me offline to reply this thread today.

 > If LoongArch boots at least once with this change, this run-time check
 > can be removed.

I will test it next Monday.

 > And just in case... I didn't dare to make a more "generic" change, but
 > perhaps KPROBE_BP_INSN and KPROBE_SSTEPBP_INSN should be redefined the
 > same way for micro-optimization. In this case __emit_break() should be
 > probably moved into arch/loongarch/include/asm/inst.h.

Yeah. I think so too.

Thanks,
Tiezhu

