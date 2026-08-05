Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1033AA4E0
	for <loongarch@lists.linux.dev>; Wed,  5 Aug 2026 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895750; cv=pass; b=UvYzv1PI2AD0uhZQjaQQgz0VJxj/w/ze3lr/r3XdQOBiqFZQdnaBWgfCxTLuDiY7rHJF3eDT9jkcIt8poOtG3rxV5/kCrO1yc4MeisFRDx3nQ+qnXSLNf4I+dSFwfe7Cm3DCLxDOFkDZIiywvEVp2SeIauHK0dXCRyoyhAhrDAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895750; c=relaxed/simple;
	bh=jeBHuE4WTkVQtqC84gsWAKgNbBisvSXKUun/omE4U5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Riy5tV1aCUINI/p8Rj0yOk0NwXtBcLL8gputmv8zzSqyeXZ6Pn0QVu0eKfEcz9ka47zx5OTL7VGDTk8JStJdO5SOM8EAA+FywkAoobuVM62e8S8so+pufpQtdQw0I8YGqbvgzbG4GyS36sm4Lr/qyi7mE+fJUedOMk0/A9wBX38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D86MB6Ft; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D86MB6Ft"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-44cf70de986so186653fac.0
        for <loongarch@lists.linux.dev>; Tue, 04 Aug 2026 19:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785895748; cv=none;
        d=google.com; s=arc-20260327;
        b=Ou7TJsKt1Qtpmma7B0No+BN3Le1bRdg6euNnhi0GmaWpyJwe1PppK94KQeswXVwHt4
         AVuLFMx8NkwPKG+L70+9PW31TFTAN/I1VXQ+HsWl7FwfIzLmHU+RUjB+6z/2YYME8UVD
         2hqIaepJxlaQo2bj11cjFDPSCj/Vb9g5m9xNuO2T1dKQwm6KtaDzyVv07XlV0oRDiMly
         kzDJaqZnXK5CIKnELch7/6vgmUqyXh1MJPCG8KRFWUNB6lS7ypIOQHoZrB5cPheapaT/
         9cOefNcPTZvm3ZHIu8UOwAahDw8yCYOB+XSYE+y3ecbkkfl3KGvJVU2VI1llMfn8rPyF
         A1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fTvjx+YN7BLrrvexWtp3Sl4BEGcFqm2fPZo8y/D+ts4=;
        fh=IoZYMX/dMJA9G3aMSGuCUhbOoiGD8SLZ31hQz8Bh9y8=;
        b=NEpzryOq9oeXAJE1owaWtvcWzq4TTLb/jtRlsrNXirktUP3XvIPZwqgeJ2BnoWsxMe
         8mFGsuxLZzHvLZq6zdlhE6IH7z4uhVRh4R9SvEjtMd4dd0ufN6vMw8URhE/sN4wwZy0E
         iLUNdSXPPsjDoKk2tWsam6DCW+m4FaMZvUD2HdGrjt1uVd9pwYfD27kn0CbeGVuRwd0V
         XIAwdStR4v7xdCvRNyeqyBpDZMPfEEUf9do7jRHsDv8y9J0TdoMkIv9JtQZgT4TZ815w
         EFlyZVwLTRnZyCfGtZ4BElHSElzqzFiZqXvV21InvyuKdMdVMeGFB5QVj8+pmiAKblPt
         R46Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785895748; x=1786500548; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTvjx+YN7BLrrvexWtp3Sl4BEGcFqm2fPZo8y/D+ts4=;
        b=D86MB6FtzVj80Q2lPiXDpZwN0hegMq4TqVPT3nYixA5WI9bloafYv59KT1zm5LuYnp
         U7MDTrRjbVD20nDu3n3hKl0A0XBrwvdYQsATRNf9kUBwlYk6Chw3auVod8cdKhlzn+kJ
         aFzkuwEZMedxqmLBIPNiEMVask6U+N1NlH19zQjNZY4LmbAnfqfc323JVglBVJqPtxcB
         jYmKDacvxaqyRmHs4YbNSCljnyv+iYq9mmNYnIb588WSExJeVJCKqfkDwzmurHTvk9HT
         Zw7uiBo22vDMIL56Cy7Xg71bLvqBmufEV93WZf8938P8/eTYl8bpZ9Z4tkkL9CiJA1WO
         HELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785895748; x=1786500548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTvjx+YN7BLrrvexWtp3Sl4BEGcFqm2fPZo8y/D+ts4=;
        b=O4Y+SD9oKR/6bigmQCE3u5vedltDkBYYM41/U85+45RFE3fxElMNEK9fpI0zvww2S8
         O9kS/25bRGbBGCpdwWJiUBkMof+N3vaBfbDXT/xoLNhuV9DMplY/C4mqCmJQz2Ml4XPY
         fq/M4s/wZ9hQqlOlwJUZrlX/3viK6u8ZQhoaM0YNg5mcroDgKLup25QtBacBQiMKgfE9
         RALObsI+MlTkIPteqDgRwhqcX/JSyyv5zIvAlfzmuFAVLlaRBnEc2AFLqEAMe1sL+yAf
         65+9lPaetpyHidwXpEOL2a8iIXno5aBx1HT2IuKrvx7ABFlPcTHlG8zNIYNrFZLRpOxH
         HtMA==
X-Forwarded-Encrypted: i=1; AHgh+RqvhI8CygTGvO4f51/9gEOs9EDcz89wOcf3p0o0tDh7sn/s+j+GEo3PmAjIcExTacEvU5p1l23p3yQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFCoxZjmDtZW0r/uvWEAtFubf9p+JX1ulrmnYZVRe4MYoHGbc+
	gzchixr2CL+Wt3zPQHDmYiQ3bVhg9okLCbu1jmGSIRrYovV0ZDR73G6i6Rj4tis00L7ToJTaYBp
	nu9ZW1PmszcbZNXRbdH0DpletBxph/gU=
X-Gm-Gg: AR+sD10sLws+muTOWef0pe8awTKPKGUX9o8V3cForXiOJRCnZ8vWXi6bryO4NXoiUSg
	EvudTmrdfozZ8Im0h1XZOi+uOQn9I+LnLgCDkwe0qM7p63p1DtRtgmdgNAz60cR7RHpyeiJg6Ar
	oFpgpC5CABiWJh3Yym+CPo2BfZsesN0F+cnTk0FGML9dHiVOPJVmfAAVTKoEGM7ANVSMTH1tLji
	n3lQWoyqMtE4BPV2pV2RmfZ1YDOh+47QIPRq9YebA+Mmoa4Spw/oAU8AjNRNLwaTP/eiFZrOko4
	yJfa26A0UHUAtgGXcmgBTQp9AZeasZt4NML2OZJvn5FfXUCXWRxW0Wvi
X-Received: by 2002:a05:6871:341f:b0:456:dbed:6b60 with SMTP id
 586e51a60fabf-4599ebe029cmr2013136fac.1.1785895747749; Tue, 04 Aug 2026
 19:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729022837.355549-1-chenguang.zhao@linux.dev> <20260729022837.355549-4-chenguang.zhao@linux.dev>
In-Reply-To: <20260729022837.355549-4-chenguang.zhao@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 5 Aug 2026 10:08:55 +0800
X-Gm-Features: AUfX_mwdkTCwcDmta6unYyTYXaaR1C-RM5YP9h5aDlMI8atqWS_kk4zD0pF-MNw
Message-ID: <CAEyhmHQbSGCdkjvncjZ7kCWpmBYJasViNtTQdsVi4eb+O1h0QA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] selftests/bpf: Enable kptr_xchg_inline test on LoongArch
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, yangtiezhu@loongson.cn, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Chenguang Zhao <zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:30=E2=80=AFAM Chenguang Zhao
<chenguang.zhao@linux.dev> wrote:
>
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
>
> Run the kptr_xchg_inline functional test on LoongArch64 now that the bpf
> JIT can inline bpf_kptr_xchg() with correct memory ordering.
>

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>  tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c b/=
tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c
> index 7def158da9eb..1215d6edd590 100644
> --- a/tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c
> +++ b/tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c
> @@ -14,7 +14,8 @@ void test_kptr_xchg_inline(void)
>         int err;
>
>  #if !(defined(__x86_64__) || defined(__aarch64__) || \
> -      (defined(__riscv) && __riscv_xlen =3D=3D 64))
> +       (defined(__riscv) && __riscv_xlen =3D=3D 64) || \
> +       (defined(__loongarch__) && __loongarch_grlen =3D=3D 64))
>         test__skip();
>         return;
>  #endif
> --
> 2.25.1
>
