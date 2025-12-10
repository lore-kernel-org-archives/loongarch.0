Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E51275AE8
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 04:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339859; cv=none; b=Qb+GXDflPz4Lzmcsq8GpVC3XVZoTo0Op17HO0bWfdr4fWN3NoLpGeeD9RZUO/IY5rsKmF4EeSxCLFZJeGnIrdqYYi8XGAK13oE6qVNQDT9AsR1xpXYuXw1ZJZfi3C7DRqQT0OTQzwVnn5QSxSI15TlndF7m2AHP35in8HrFctFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339859; c=relaxed/simple;
	bh=6izA038pvJwAGbYN7aai9+uLFOQlBe5zqjx8SpzOhos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvveJ4eYOIpZVoakKj1L8cNuo07Edx3By5YMBgh+T2AxfjWmC4uUMohALB03jWeMP72aMF2akyr3xObHRV/Spd2FVyybKoLeSD6QAFh7xQ2lyHDXrKtO/xSrFmLcLnDSmVWIFGYVkoHlAZpxQHYHNLBtSx1CRGPPlKQqSp2siPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8nHmXV6; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8nHmXV6"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3f5ba2fc0d1so236314fac.3
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 20:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765339857; x=1765944657; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05Ohqymv64sYflY2wosqKmDxhcq182Tz+w0uCWFRgjg=;
        b=m8nHmXV6SOP1Q1rQ8ZSihIhvvGh1+CkzxyRAkECHkzO1NeiU+p07scIIVC/W9NwsZy
         j4kOzjTHP5rSwTXI+dJnqm0z1M0Gyh6R4c093ir4/++tgN++QuHy8gwigPrJ2f4srg+v
         +MwP0/UklX/o8uThpkYVuddEGBdz1znnMIrZoIUGOT6MoFOKf2RXwoP+4yPUahoxnX/A
         nRfivv1167bVyKAxP8i2XLdf4gUtjBL4IQI+k/KrdRpAJntkb0+SVB5BUz7xnj1MsmxV
         rXzHJ+CGDx1zqmA5kPpSl3pAZAhnC0EUxSgUoouh1ge5n13HtjQLjTHHU1FghzQaQUPg
         ddFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339857; x=1765944657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05Ohqymv64sYflY2wosqKmDxhcq182Tz+w0uCWFRgjg=;
        b=oEI9Tkxd3NtpSWlI6DgLNWOkfoPmq2uIOyh/pFD66ShTEo2srFEHJ+S0HWlPvnHLp0
         sKbd8jJDtEpcqDqH2vvXyw2ifsBx/j1TuCwLx1Ha/1LEks3Uqmv3kOd2Snhm29p8LJ/J
         VZAy1+4ZPRFzQXDFEM87ebWX9N+JHyQZslMjnY2WXJp0RJKxyCs+g3SPhfZiY42JcM3d
         mZ+y+4Paxj+OC+QutucO3NSTwKMh7oqq1jt93XbxKbhKI7XXQNSyUgIAxYADgrdB0nBh
         8e9BG/yfjLjicpIht+/2s3q6+wibmnDjntOnLYQ7fOz2OA75YvDv2Aptc5mLigfFOcOA
         VPaA==
X-Forwarded-Encrypted: i=1; AJvYcCUbOSMd2q4UUN7/8Mi5qHPtFVyVajAdCRJeQzymssPM/72j74Z6FWG96qVa62VbHjWVqC0CGj4swXg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy32EZl5zlGRui1qPsJx/8GhOnCuJXlgls3zVwV+PQLvlYuC8nj
	rHQ5ZjZiDKr1E8LbQ2GcMxZrIgEz5fygp0AoLhqRfHwcbRScnvMI6RYFMq99/6F8QcXHbAwKEG0
	mK9BC8bR9gfctyfW4UWwgSNveZcy8jgU=
X-Gm-Gg: AY/fxX65p5ILhKkp9Ch5YEqQVZfT/OU9uGYtfZKL6ULaQD7kw3OJu0RoQkzeftHGIfI
	plluMskPXQA4sOpcDCKHUKhAzoBkHaCbkdWxKFqR0+AHet6TuY96hrFrZPGXar9ibzg17qykhob
	t0Ayq/8ibqXMMIurW3VKBG9N82unXDuGULONc/ZnA2xTJ1Exyi5dMBXc6ad2TlL+iNCseH5SdvA
	ZSpRAxhuS5epwn/SIO3F06QyoiQ64uH7NM4gaaxEKS3J1XqEYNB77WZZC57qfUM2Vm9Rq0=
X-Google-Smtp-Source: AGHT+IGvOLDqAi48Ic3hLyhgd6qi1EOL/WncW14U+ZY1gmlw5gMPVtA35JKcJhsvPKHOF5Aj4Aldqg/Qvbp9osvrMbI=
X-Received: by 2002:a05:6870:4119:b0:3f5:c07b:d966 with SMTP id
 586e51a60fabf-3f5c07be927mr399166fac.53.1765339856939; Tue, 09 Dec 2025
 20:10:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209093405.1309253-1-duanchenghao@kylinos.cn>
In-Reply-To: <20251209093405.1309253-1-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 10 Dec 2025 12:10:46 +0800
X-Gm-Features: AQt7F2qjEPNMQoDRmcyfVJ5v3fPjMhCIxLEuMdBBnWdI885YUD2fmrUaJr90nW8
Message-ID: <CAEyhmHSPQLd2ivmzcNxDcKJW8143HLi_=syo_8iBPSxWE35pog@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Fix the failure issue of the module_attach test case
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, chenhuacai@kernel.org, kernel@xen0n.name, 
	zhangtianyang@loongson.cn, masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, guodongtai@kylinos.cn, 
	youling.tang@linux.dev, jianghaoran@kylinos.cn, vincent.mc.li@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One minor question, I wonder how you debug these issues ?

On Tue, Dec 9, 2025 at 5:34=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos.=
cn> wrote:
>
> The following test cases under the tools/testing/selftests/bpf/
> directory have passed the test=EF=BC=9A
>
> ./test_progs -t module_attach
> ./test_progs -t module_fentry_shadow
> ./test_progs -t subprogs
> ./test_progs -t subprogs_extable
> ./test_progs -t tailcalls
> ./test_progs -t struct_ops -d struct_ops_multi_pages
> ./test_progs -t fexit_bpf2bpf
> ./test_progs -t fexit_stress
> ./test_progs -t module_fentry_shadow
> ./test_progs -t fentry_test/fentry
> ./test_progs -t fexit_test/fexit
> ./test_progs -t fentry_fexit
> ./test_progs -t modify_return
> ./test_progs -t fexit_sleep
> ./test_progs -t test_overhead
> ./test_progs -t trampoline_count
>
> Chenghao Duan (2):
>   LoongArch: Modify the jump logic of the trampoline
>   LoongArch: BPF: Enable BPF exception fixup for specific ADE subcode
>
>  arch/loongarch/kernel/mcount_dyn.S          | 14 +++++---
>  arch/loongarch/kernel/traps.c               |  7 +++-
>  arch/loongarch/net/bpf_jit.c                | 37 +++++++++++++++------
>  samples/ftrace/ftrace-direct-modify.c       |  8 ++---
>  samples/ftrace/ftrace-direct-multi-modify.c |  8 ++---
>  samples/ftrace/ftrace-direct-multi.c        |  4 +--
>  samples/ftrace/ftrace-direct-too.c          |  4 +--
>  samples/ftrace/ftrace-direct.c              |  4 +--
>  8 files changed, 56 insertions(+), 30 deletions(-)
>
> --
> 2.25.1
>
