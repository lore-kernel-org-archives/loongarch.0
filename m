Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2821E570D
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 01:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157597; cv=pass; b=ODoRq+MhcEva9wj0Q81BSU3kuXamLCbdtjdfq/aoRGEFP417sBbpRF9/EwUcE5SkHz/C3HpuSwP7Z+eCQnEv5wDtWDpAt+47xbEXoJahk0iZb2uA8yHVAVNKcX0Ofm4+9Ho8qin5P/7jm4FW5wT1dupldj1dD39s4vu2ZE4jcz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157597; c=relaxed/simple;
	bh=Ij8SC/G3dcyNsGNqzFPAw24A5ANOJGekvDBGgGPZ4Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elOrJxCdWH9uqZnZekwFclHhai+TqeKP0zbdjMivN/g4/AQwmuu2umH0DlHY6blm5Tmu3FhvocHAlXmDFZrOxpKLYCgG/oEucgvZj9lOsVLawSnNvY1A1rRTPPjOA2N0gPzRi0A6CQSoxJBT8uyBpxUY5B/wVlU4J1AFa1LSFKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kg7HmQe+; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg7HmQe+"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-506a747448dso13218021cf.0
        for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 17:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772157595; cv=none;
        d=google.com; s=arc-20240605;
        b=KPTpUjlBvKStevEaYvVTncsQnI+bGFOXMn1o3DfmpLqd030IE/pgZ60iKCDxXQS0Ed
         8JmrkyImuP9KkUICaVhLA82kMm0JjjK+rStlPZmo/+l71CBaKL137/mq3C0Fxu0k85w/
         25piuNFZWndoD2pwwgpmR7X//aTLbrR+VbvrtukxI5YKeEFrS9MNPn9T3V0OZEXJm8em
         bUIykA9IGNtDIMOkgEdLrwKD3IHuv+QXaEUiQK5KgOy7ivnxfNkAsTGISApmxeo2IH1z
         ZTvJF9Zl7ZJ2arbaGMrEKy1N58eNpd1djDQHg9owv5ywPJUZivzdvOFVUc+k5fSgy1Rw
         GHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=evNy6jazY3xnKMkGc+5DNvdvNChV3K/OuW2kn1xZLCc=;
        fh=xqGkAUOtfNwj3dzSVLA7YSt441lh2IGaAhYKW0hytPo=;
        b=WCi1oA4JYq8lehQ6EKvim92K9OWLDAokKXsIF1h21Wf/wpf0c7xnERP8iKazhmsvbt
         ZsBTss94aiLQc50mBAykLGKuLKeOOa+aK/IrIMiD0acdKfpyFM0DGyfvc8aktUV4c5kU
         XgOW8AwSp49MXAiAuIgII0fRiGghohpU+x7vvAYBtDte0MwdQDl2IdqmKQLDwgkEBPeC
         7PPRCJFS9tZmeVjHNhyt6QFyNkHSMfsbIr7D3sgIHUiixsW/qAVVJ7NFITAMfG83n3Vo
         7W0H8XBHKEnHFgBVPeiU305fp7GkEMqHt/sVi8uGqKxQISCiU6tmLQ3PAyPUibFEVpa0
         D81w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772157595; x=1772762395; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evNy6jazY3xnKMkGc+5DNvdvNChV3K/OuW2kn1xZLCc=;
        b=kg7HmQe+BgQW4pwv2SYelF31+5pptCjfvCeSWtx/9XOaqet3vPprEA9hZSGLQFb7E+
         eJ5o0KCIi2aPacK0hACe3BB576e1dv68JfU9ap7iWDIaprNW6O3K6Was1sqhX4vZPsRH
         vhiGfnmJcgbsacsTy3cB2BDp7MiwvN+kk0yGexUXF5wSA+aKWq9Rizyq1OXVj9pSeW+x
         VDPtGnsx/A2WJ3bPuksLoFr4EtzpvglLtBqKYdA85zJ0r9F4YEtHa83UH/IZGeDtBS0W
         SJwmlVYKNSOchyBMoi1LV5VtRF/X2CrARDK34FOwKvEqKJSE8XN1fcALo1zEetVma9jA
         Qk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772157595; x=1772762395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=evNy6jazY3xnKMkGc+5DNvdvNChV3K/OuW2kn1xZLCc=;
        b=SoDNdFajBz35qk6wnQt2bqZInxMbg23ETT60wC8duQ0HCUAKQ3RQlZs0rrfRw3vJVS
         zBDVtxL0TnLN98jQBDFyQndg/9LOx4O5Ih71h4tnxiOAfy3Jm/36O72de25cyyOeAFh2
         NRoeamLcQGvpSdyPVSCMi3XO/90vBWwas6MJE55hIMPjObx8KTpYVMNNuji9V6Nt73dk
         2cJhETmHMi8kmBAgNQNiZWwATI3bzOqUdTFbxQ0aunvoW/WuFUihei5mIwg2xfGLVf7V
         ioWCGb86T3F5Vk0SmPhD1he+77TYEtxcNqBBH2IumiEvjjx/v50m03fwzCaOZh6f0hTi
         xgkA==
X-Forwarded-Encrypted: i=1; AJvYcCW67anNq5o9WVsXyWJQa1O7qQq+0uWBdt1qKTR7xZdHyGriqlxmpVFRymjntY1pIP169fZXojwD3qw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7DLMt7/ccigs+2t+skc6uVQESJo3gK7ganUL3Qif5S7hyzTI1
	ukNdDS5hctLTziXrPphCKI5FH/hf/utriy32tTzOpz/9skMeIcs8Lb2m36EXHjI6cDab0I33EeU
	/MDv99XPk1mkXuoAgMy3xEtiVeMNRe08=
X-Gm-Gg: ATEYQzxgdd9QbrT5t3C52QEVLM9FeNzdZAUDqP08ESwSm1bg2s/lcsQO4JadsxZghDr
	poXdTYMroqom+0CudwJmVawi9e1c73PbpMxK2NehIi3uARALx8vZzJ0H8GIvKVqC2Qk2wq92QyU
	lDFjwd5R+oLH/hShQgvoLZIBapMEcJt79mIuuqBSL1803MVn6VqTrMkjz8h2K9TU+UtejLL8QFp
	njRbK9FaMCYgC1Ii3HmDIMDAAaikqabZf0N7NqhDvqsBTXvhrqzCQv9+d6gzvMSjbkMYj4BD17c
	1fyYo2w=
X-Received: by 2002:a05:622a:1190:b0:4ff:c17f:726 with SMTP id
 d75a77b69052e-507527146cemr16522181cf.15.1772157595056; Thu, 26 Feb 2026
 17:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226065952.4082859-1-hengqi.chen@gmail.com> <20260226065952.4082859-4-hengqi.chen@gmail.com>
In-Reply-To: <20260226065952.4082859-4-hengqi.chen@gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 26 Feb 2026 17:59:44 -0800
X-Gm-Features: AaiRm53dVv20PZPdJFbffE_0aav73coUVY6FwOJJ0z1TIffKxtwmmOKxgDmhrL0
Message-ID: <CAK3+h2wDcR4tsLQMaCjo0qQxyyYCY-t5w7_5nXXVCAX9DsNbSw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 3/3] bpf/selftests: Enable fsession tests for LoongArch
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, chenhuacai@kernel.org, yangtiezhu@loongson.cn, 
	menglong8.dong@gmail.com, loongarch@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 11:00=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
>
> Now that the LoongArch JIT supports BPF_TRACE_FSESSION, allow
> the fsession-related tests to run on LoongArch.
>
>     $ ./test_progs -a fsession_test,get_func_args_test,get_func_ip_test
>     #136/1   fsession_test/fsession_test:OK
>     #136/2   fsession_test/fsession_reattach:OK
>     #136/3   fsession_test/fsession_cookie:OK
>     #136     fsession_test:OK
>     #138     get_func_args_test:OK
>     #139     get_func_ip_test:OK
>     Summary: 3/3 PASSED, 0 SKIPPED, 0 FAILED
>

[root@fedora bpf]# ./test_progs -a
fsession_test,get_func_args_test,get_func_ip_test
#135/1   fsession_test/fsession_test:OK
#135/2   fsession_test/fsession_reattach:OK
#135/3   fsession_test/fsession_cookie:OK
#135     fsession_test:OK
#138     get_func_args_test:OK
#139     get_func_ip_test:OK
Summary: 3/3 PASSED, 0 SKIPPED, 0 FAILED

Tested-by: Vincent Li <vincent.mc.li@gmail.com>

> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  tools/testing/selftests/bpf/progs/get_func_args_test.c | 3 ++-
>  tools/testing/selftests/bpf/progs/get_func_ip_test.c   | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c b/too=
ls/testing/selftests/bpf/progs/get_func_args_test.c
> index 075a1180ec26..afb185fdf60c 100644
> --- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
> +++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
> @@ -167,7 +167,8 @@ int BPF_PROG(tp_test2)
>  }
>
>  __u64 test7_result =3D 0;
> -#if defined(bpf_target_x86) || defined(bpf_target_arm64) || defined(bpf_=
target_riscv)
> +#if defined(bpf_target_x86) || defined(bpf_target_arm64) || \
> +    defined(bpf_target_riscv) || defined(bpf_target_loongarch)
>  SEC("fsession/bpf_fentry_test1")
>  int BPF_PROG(test7)
>  {
> diff --git a/tools/testing/selftests/bpf/progs/get_func_ip_test.c b/tools=
/testing/selftests/bpf/progs/get_func_ip_test.c
> index 45eaa54d1ac7..3816a3616fbe 100644
> --- a/tools/testing/selftests/bpf/progs/get_func_ip_test.c
> +++ b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
> @@ -106,7 +106,8 @@ int BPF_URETPROBE(test8, int ret)
>
>  __u64 test9_entry_result =3D 0;
>  __u64 test9_exit_result =3D 0;
> -#if defined(bpf_target_x86) || defined(bpf_target_arm64) || defined(bpf_=
target_riscv)
> +#if defined(bpf_target_x86) || defined(bpf_target_arm64) || \
> +    defined(bpf_target_riscv) || defined(bpf_target_loongarch)
>  SEC("fsession/bpf_fentry_test1")
>  int BPF_PROG(test9, int a)
>  {
> --
> 2.43.5
>
