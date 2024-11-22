Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD46469D
	for <loongarch@lists.linux.dev>; Fri, 22 Nov 2024 00:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732236071; cv=none; b=W3OW3LSNeo5JW6hAhUIzTGRPOuxnH9NFr1TAMu8sOwj2soPvLcgb6lh1nFp6X9Eq7pOfQ2dKaxF4Qb8bKv3TB9lQrGvIXV+KlFqR9PEhzfn+TZPoNfinKUclt6MbOvli30ejQAJ0o0sGIaG9YbqNdWfom8u786vd2F+RSZwYWZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732236071; c=relaxed/simple;
	bh=z9dF6Emhtspyw3VwGifMj3kprIqiID/ABO92TYKcqwM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=CRpekzuIf5q5fnZuNz32FDb321ZEk5NPqm9Vxh4u8yyxriK9fSEP73iZdR+sKvexMyD4xwmtVRXQLVWX6VHPNyh/jRabwVGBHaD5W5EzkMFEYyGOJLxJ1zxCrv10sRl/OQgTn6Yv5vKWSvIHsaGzaD8e9dvS/+oDFNPzv9IQB2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUJiHKiQ; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUJiHKiQ"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-83ab21c26e5so53225739f.1
        for <loongarch@lists.linux.dev>; Thu, 21 Nov 2024 16:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732236069; x=1732840869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04MVoN+OIvJr2YdZQzPbMEP15dXCFEy6P+SherFyn/8=;
        b=MUJiHKiQzcKYrl90QX2bOE3TuMuqgrfe1NiRlk/NvLdzrP94cwJNsQNBhQkhmOpBtO
         NrRKhogSn1IFAra3tfzK2JzbXtuo4FsGpmf8+cUk6dwTskgIgScRYF++UojHsv/6OX0W
         GWPP4y45/rjJRESiAjO8nT6elQC0USWOEY+72mb1u9NdGKMxmjle8yvZBqoUXSk+Xs/O
         R2wzukU7wQwXTp8K0icsJJd2WrubpelKpAbMZAGWSwmO4EIDW0xXcyv41WXRJPtY7zeL
         IHWei8cE5f50Wn2InsDddzohlkt5iTOJN+tEfR5NvN9VWW0cM6nGRUt2gC9AgsfsrnbH
         NAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236069; x=1732840869;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=04MVoN+OIvJr2YdZQzPbMEP15dXCFEy6P+SherFyn/8=;
        b=kIj2Y8dZAKIVomZVKeHKI0SSi8Ei12WnPVURi4byo1FXaIA5lmXFF90t8PlziuqAn8
         mfPIz4wvdxIIjUjV/yKKX/6vEngh3ySHY/LmLMbEi3LJ1lQtt0LhH7KBgdTH7yL2v6Sk
         w8CaXqRtmst7nvUzxCLAT1+kSk+yRyflWRiyUUlMY4375WOCupuyyyVOFJq9B7tGxSzO
         3ZKcOxMhXRuJPWJLSfHHzD41VHIpoyTXSUE3Th2O1NHj+H002+lI+Kb7c8qliJuTektp
         QMyez4fuDW7ebzhfQikA89zMLnq0jjHt6f7tzTiI+wytPC3mGnujrw5d6KrAvbu68sYa
         HePw==
X-Gm-Message-State: AOJu0Yx6C+ZztMLcEbJtMh53TVuftfCtfowgrmAeGqTLzdO5OyLhhUkm
	rESqibc6FV7ENrzUiySFMUURsDT4ts6mD3Iqutske3f2Sd7t/NG+
X-Gm-Gg: ASbGnctKx+4c51ihF69Pft1SU4scrQ5QY+rq+gE+2j/MoYJCxSACUVLyLCbZMT2uOwF
	fDfXW4v3Cd9SNj2Zdn+s9MJKr9YF0FOlN4W0/IkeaSME1y+EhV4nwp+HUZkeWk6bOy/J1+Wutug
	DCk+53YNmxn2OEs6uxN1xz4YSOdyIKLJffffslDv0EU3gLlqhV1fUUXHvU7tpCOWat0OXSwusY6
	DWis0WN9as01lRbnZzp+XqiH748qzcZTR69SLe9l+M21J+lM9k=
X-Google-Smtp-Source: AGHT+IEpZv48o7EMNyfIQ2/+C0TuoNaUSVg007ysRSyWDMDywOYlRzeOC5AR7mKVUg9lOrgUPMj8Kw==
X-Received: by 2002:a05:6602:154d:b0:83a:f443:875 with SMTP id ca18e2360f4ac-83ecdd140e9mr91707739f.15.1732236068775;
        Thu, 21 Nov 2024 16:41:08 -0800 (PST)
Received: from localhost ([98.97.39.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcbfc08efsm402586a12.16.2024.11.21.16.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:41:08 -0800 (PST)
Date: Thu, 21 Nov 2024 16:41:06 -0800
From: John Fastabend <john.fastabend@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, 
 bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <673fd322ce3ac_1118208b3@john.notmuch>
In-Reply-To: <20241119065230.19157-1-yangtiezhu@loongson.cn>
References: <20241119065230.19157-1-yangtiezhu@loongson.cn>
Subject: RE: [PATCH] LoongArch: BPF: Sign-extend return values
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Tiezhu Yang wrote:
> (1) Description of Problem:
> 
> When testing BPF JIT with the latest compiler toolchains on LoongArch,
> there exist some strange failed test cases, dmesg shows something like
> this:
> 
>   # dmesg -t | grep FAIL | head -1
>   ... ret -3 != -3 (0xfffffffd != 0xfffffffd)FAIL ...
> 
> (2) Steps to Reproduce:
> 
>   # echo 1 > /proc/sys/net/core/bpf_jit_enable
>   # modprobe test_bpf
> 
> (3) Additional Info:
> 
> There are no failed test cases compiled with the lower version of GCC
> such as 13.3.0, while the problems only appear with higher version of
> GCC such as 14.2.0.
> 
> This is because the problems were hidden by the lower version of GCC
> due to there are redundant sign extension instructions generated by
> compiler, but with optimization of higher version of GCC, the sign
> extension instructions have been removed.
> 
> (4) Root Cause Analysis:
> 
> The LoongArch architecture does not expose sub-registers, and hold all
> 32-bit values in a sign-extended format. While BPF, on the other hand,
> exposes sub-registers, and use zero-extension (similar to arm64/x86).
> 
> This has led to some subtle bugs, where a BPF JITted program has not
> sign-extended the a0 register (return value in LoongArch land), passed
> the return value up the kernel, for example:
> 
>   | int from_bpf(void);
>   |
>   | long foo(void)
>   | {
>   |    return from_bpf();
>   | }
> 
> Here, a0 would be 0xffff_ffff, instead of the expected
> 0xffff_ffff_ffff_ffff.
> 
> Internally, the LoongArch JIT uses a5 as a dedicated register for BPF
> return values. That is to say, the LoongArch BPF uses a5 for BPF return
> values, which are zero-extended, whereas the LoongArch ABI uses a0 which
> is sign-extended.
> 
> (5) Final Solution:
> 
> Keep a5 zero-extended, but explicitly sign-extend a0 (which is used
> outside BPF land). Because libbpf currently defines the return value
> of an ebpf program as a 32-bit unsigned integer, just use addi.w to
> extend bit 31 into bits 63 through 32 of a5 to a0. This is similar
> with commit 2f1b0d3d7331 ("riscv, bpf: Sign-extend return values").
> 
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 7dbefd4ba210..dd350cba1252 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -179,7 +179,7 @@ static void __build_epilogue(struct jit_ctx *ctx, bool is_tail_call)
>  
>  	if (!is_tail_call) {
>  		/* Set return value */
> -		move_reg(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0]);
> +		emit_insn(ctx, addiw, LOONGARCH_GPR_A0, regmap[BPF_REG_0], 0);

Not overly familiar with this JIT but just to check this wont be used
for BPF 2 BPF calls correct?

>  		/* Return to the caller */
>  		emit_insn(ctx, jirl, LOONGARCH_GPR_RA, LOONGARCH_GPR_ZERO, 0);
>  	} else {
> -- 
> 2.42.0
> 
> 


