Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476E3B8944
	for <loongarch@lists.linux.dev>; Thu, 12 Mar 2026 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307794; cv=none; b=rGDaYQUVvWPwBu5gH140bpvO4vdh4OTu5F4lyMpaDtI3gB6FJVZE3lXF3x4ThYGVUVhtlB66nKQs7Vxhrwhv191fs0p2QhGPa2CjnqH5hbCVs8HC7ocf1fiISn+1/TGsvwmXOEREkMdQVkP5ErNYWliS0G8EJwUX6ilQuwVypps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307794; c=relaxed/simple;
	bh=q6MJzu5+YHTxdljkNnf4jYTKza5wayB6oEnOn3+6DDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ40tkVep1BYwB2o5zip6tDI2TkZhSS4bMWRJZdezwQ6TKQx9hG9o5cWSSJNrCuHFl6v+VGuxxVOQ0zSG0ujPxCjeL+QQw/AHC/Sg1KPcKMTAx9sriPjPtoYCdf4MB9Zs1EAS5TP7bsvzkJe+yG8mRusQ8D6uBWpmvz37PyDdvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TADxK3AG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TADxK3AG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so7085545e9.2
        for <loongarch@lists.linux.dev>; Thu, 12 Mar 2026 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773307791; x=1773912591; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=48ePxsccF8Uxw25h+Bp/9IWess/Z+mmqJesR4Y9xVUk=;
        b=TADxK3AGXI+KwfWcKGd4xh0wOhKMlurstJ9mE++VaGtqavHB2qlGAU3iUYkCYInWEx
         gaH5xZbowLNduAytViKF7opZ99gPJB+Mmwtkj3jvkkdsc38NZ1QUVXiK4/X1cMw64C5K
         VrJz8G3j1HlVaT9aXI7Vmb/A2Tb5MrElCo+uJAHEISP0pJDwxFWemsbQECbMUSzPxOlW
         FsMmt4fy0l62LYdZmV9TRNyvb0DvdkCWN7BYumP0lbkp6ucX5AkWGlbPlkOmagnVVHJr
         MymUrYZBD25OpgLHv7hNTofuSD2rFr3quUWb3L3RB737RZgQwPAJKLNDEp2yoi/sWvNk
         O2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773307791; x=1773912591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48ePxsccF8Uxw25h+Bp/9IWess/Z+mmqJesR4Y9xVUk=;
        b=mqLWgONf9QPon9Z7iWONQX5NridOtwHgqATC7YadGTcjEE+j22tnK+fp1hv0HLDFzi
         xcLCv2fbNkMY5x+rwBHl29ojcxTxuBzgLv3XlTjZnwzM/sqgB5XWZPe1od/LZfh5R4GU
         /MFRg0FCwpT+gW139uDapjNA3Dps0BzTKY3VVsAuHVlWV0aHgf3479C332TtzOuoZyaS
         XZfqSpTBFhY7Ut31sjIxlZYuzZJaSes2eF4zXDl2VIO19JGUfy9BDMw4Wc/I+Rw2zXX2
         SfItOVorLUpCjW7YOUvpVS4ZQw5bfHlRnVH1xMtdv6OQVOxqNuAGIAs+uSlQ4ujlSngA
         /n7g==
X-Forwarded-Encrypted: i=1; AJvYcCXLTrA6k+Ir5Xe8zHnV1ZZP1FongC1DzZJUC8D0NxaYcyeweaeIDXuMpI0aDhEPIGZTXQFd+z0Y/vU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwusZj1SAHHZUFmg+ZI5kbOP46v+hr24gBNud3a43C/tZQCoom6
	w1KnFQCbr68kC6mFQ71NY81Qc0u1CbsDuw+FHoNNfLRl+sTrh9fcAEN0
X-Gm-Gg: ATEYQzxpqmms1AuO3j7aCTDKKPc3X0sRSByOKyB66pXhoWSbKeg7Kp9kBIkpO+kFGbz
	GYmlB6cF1Roy69jVk8pm/FtxMvgw7ZXm2kkLvHHziAkX30vVzpMhVlNLAx2JPhl/yZJWnfcw2ls
	SPVtaZTHSPp/sv0Hh+cLDM3rhXPMYHOfZOv7WCrLl49wZwxvHzwv6+FJBad4p03OwTD1P3VxMTR
	eNeaS2lfMcT37u9NgR8JmFFA06cHrrWModcqJLDTmd7vfiZxZblbtz56CQ9Jn0+ZczQXDXD0ulG
	caQCxepyu/UZw1tPeGecDwn5iz/G2Pfl1m+t0e4oq/oQuuEK7eOQ1/W2mTajvsBf5JbiAOLcCbH
	UMXoiYDMRwZ9PZCRGaL+P1wStHg8Z4O8gmeLt3exvQCsQZ2EiJbcJuY68Voy/TQQDZHoQqDPdbH
	juzqOY9qHq6n9+vXEMQtrkE+f3mFnFb2920+e26NPl7dXcxS+DgGzB5MGoOn5F3393qutmu7sGk
	3Bq3jJrsQtvkDnj1vthxTzvl/q/ZfbmXbzx44MA7VhHf0LLYhJzcofk1GifZerbbzoIgNnMjVIV
	2tZRUN7iABzePeM4SQZ/FQ==
X-Received: by 2002:a05:600c:6090:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-4854b13c02emr94171935e9.32.1773307790948;
        Thu, 12 Mar 2026 02:29:50 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e00e621310b96d0fd4d.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:e621:310b:96d0:fd4d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a2fd030sm70819185e9.2.2026.03.12.02.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 02:29:50 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:29:47 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Emil Tsalapatis <emil@etsalapatis.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 1/2] selftests/bpf: Check alignment flag if
 expected result is REJECT
Message-ID: <abKHi9Pr5iUbIQZI@mail.gmail.com>
References: <20260310064507.4228-1-yangtiezhu@loongson.cn>
 <20260310064507.4228-2-yangtiezhu@loongson.cn>
 <DH02R7I6EAUH.16649BMB7V1N8@etsalapatis.com>
 <fe04d981-fc83-0ba6-4dee-8fc0c953e09f@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe04d981-fc83-0ba6-4dee-8fc0c953e09f@loongson.cn>

On Thu, Mar 12, 2026 at 02:59:57PM +0800, Tiezhu Yang wrote:
> Hi Emil and Paul,

Hi Tiezhu,

> 
> On 2026/3/11 下午11:56, Emil Tsalapatis wrote:
> > On Tue Mar 10, 2026 at 2:45 AM EDT, Tiezhu Yang wrote:
> > > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set unconditionally for the
> > > most archs such as x86_64, aarch64, ppc64el and s390x, but this config
> > > may be not set by users for riscv64 and loongarch64.
> > > 
> > > If CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set, the BPF verifier
> > > detects if a program has unaligned access and then rejects them. So it
> > > should also check the flag F_NEEDS_EFFICIENT_UNALIGNED_ACCESS if the
> > > expected result is REJECT and set alignment_prevented_execution as 1,
> > > then the message "(NOTE: not executed due to unknown alignment)" can
> > > be printed for some testcases of test_verifier to reflect the reality.
> > > 
> > > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > > ---
> > >   tools/testing/selftests/bpf/test_verifier.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
> > > index a8ae03c57bba..a1ae2f044e96 100644
> > > --- a/tools/testing/selftests/bpf/test_verifier.c
> > > +++ b/tools/testing/selftests/bpf/test_verifier.c
> > > @@ -1640,6 +1640,11 @@ static void do_test_single(struct bpf_test *test, bool unpriv,
> > >   			printf("FAIL\nUnexpected success to load!\n");
> > >   			goto fail_log;
> > >   		}
> > > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> > > +		if (fd_prog < 0 &&
> > > +		    (test->flags & F_NEEDS_EFFICIENT_UNALIGNED_ACCESS))
> > > +			alignment_prevented_execution = 1;
> > > +#endif
> > 
> > This doesn't look like it's breaking anything, but it will cause all
> > tests with F_NEEDS_EFFICIENT_UNALIGNED ACCESS to be reported as failing
> > due to unaligned accesses even if they actually failed due to expected
> > errors at load time.
> > 
> > Which test programs is this fix targeted towards? Can't we just skip
> > those tests for riscv/loongarch instead of adding this workaround?
> 
> Thanks for your reviews.
> 
> It does not fix any failed testcases, the testcases passed without
> and with this patch. It only affects the output for some testcases
> such as test_verifier 14, 153, 190, 191, 193, 197, 200, 201, 202,
> 204, 255, 256, 295, 297, 298, 300, 301, 302, 307, 308, 331, 341,
> 342, 475, 477, 500, 512, 514, 515, 517, 520, 522, 523, 525.
> 
> For example, for the test_verifier 14,
> verifier/atomic_cmpxchg.c:215
> "Dest pointer in r0 - succeed, check 5",
> if remove ".flags = F_NEEDS_EFFICIENT_UNALIGNED_ACCESS,",

I think I'm missing something. Why would you remove this flag?

Are you trying to illustrate that this is a program that could be
rejected because of misaligned accesses? I agree, but here the flag is
set and this program is therefore rejected because of an invalid memory
access; the misalgined access check is skipped in the verifier.

> here is the test result if HAVE_EFFICIENT_UNALIGNED_ACCESS is not set:
> 
> $ sudo ./test_verifier 14
> #14/u Dest pointer in r0 - succeed, check 5 OK
> #14/p Dest pointer in r0 - succeed, check 5 FAIL
> Unexpected verifier log!
> EXP: R0 invalid mem access
> RES:
> FAIL
> Unexpected error message!
> 	EXP: R0 invalid mem access
> 	RES: misaligned access off (0x0; 0xffffffff)+-8 size 4
> verification time 27 usec
> stack depth 8
> processed 5 insns (limit 1000000) max_states_per_insn 0 total_states 0
> peak_states 0 mark_read 0
> 
> misaligned access off (0x0; 0xffffffff)+-8 size 4
> verification time 27 usec
> stack depth 8
> processed 5 insns (limit 1000000) max_states_per_insn 0 total_states 0
> peak_states 0 mark_read 0
> Summary: 1 PASSED, 0 SKIPPED, 1 FAILED
> 
> It seems that this is because the program has unaligned accesses,
> but the kernel sets CONFIG_ARCH_STRICT_ALIGN by default to enable
> -mstrict-align to prevent unaligned accesses.
> 
> So I think add "(NOTE: not executed due to unknown alignment)" to the
> output is reasonable. Something I missed?
> 
> Without this patch:
> 
>   sudo ./test_verifier > log.before
> 
> With this patch:
> 
>   sudo ./test_verifier > log.after
> 
> Here is the diff:
> 
> $ diff -uNr log.before log.after
> --- log.before	2026-03-12 14:19:04.119957887 +0800
> +++ log.after	2026-03-12 14:23:03.468251328 +0800
> @@ -26,7 +26,7 @@
>  #12/p Dest pointer in r0 - succeed, check 3 OK
>  #13/u Dest pointer in r0 - succeed, check 4 OK
>  #13/p Dest pointer in r0 - succeed, check 4 OK
> -#14/p Dest pointer in r0 - succeed, check 5 OK
> +#14/p Dest pointer in r0 - succeed, check 5 OK (NOTE: not executed due to
> unknown alignment)

As stated in my previous answer, this note would be incorrect: the
program was executed in test case #14 because it was rejected, not
because of unknown alignment.

[...]

