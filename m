Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A2367B86
	for <loongarch@lists.linux.dev>; Thu,  2 Jul 2026 05:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970777; cv=pass; b=hQeLvistjdUNcXzYULU2t1EFmhTkWyXzIrk5k+7h38CO6oLL7XpBFaA3MY2Q/Xw3O+3vtXf++XbO7uQRcrQ3uZiqvqSaMUdpry2S8l+7uFqO8YH83f0QWDE0Z4FNMz8/0jAmU4eC47By5W6R6qSB2mtxV7H1d1eQ4n9WDmglcjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970777; c=relaxed/simple;
	bh=r0oea4DsE+/Fov0KykxRB5CSjwQYNH/nKviFCsjXURo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXEvUA1PNKN1OItw1GZ3EOu/t2c3MHF5n58DspwFlW0vk+C/5XV9jhqFHNIt4ZMyeWmAv+G6jVtxeIlXf9FZZI8vpXsThP9k7CKVMPLfTZmW8CLQ+7HSh4JmmXUz9cSYtVMPHWCaLt+kq1hPQ43mtj9zMr3uPfkKP+QbAbVneh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUEX1XwQ; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUEX1XwQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c82da9504cso7928575ad.2
        for <loongarch@lists.linux.dev>; Wed, 01 Jul 2026 22:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782970775; cv=none;
        d=google.com; s=arc-20260327;
        b=FhUNELMxLxKoovlxjlQFdMGDTuiXNLGRXmyfLnuUhI1hP9Tq9BJQfas+vYVzHUVnRf
         SyDLUaZ3yfYWehPR266HT41j3yHLGsOkZdsxYzJbLUkRyEr9BkP1AOGTXvkyqZf/Jgky
         gAjleOQb2Aqfp/rK2o0W/7cBu6C2nW+98GsIFCjXH2LR2UF8bgbSRsBk155df4rZREil
         kHFX8GVU7X8PeHZA49yhe8VeL4/NxzV7R4jaPwO6AHbE9J0qvz9KZpV7PXbtC3rdmDyU
         h9StK1JR7vlrb7FuEqiOoV8JGbIlJfTW7neMLx5jsRQ/1SAhBHixetMvfp4IiLKiZQpw
         yN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0oea4DsE+/Fov0KykxRB5CSjwQYNH/nKviFCsjXURo=;
        fh=g5Y5rcHx09nz+7w2nkPFHHt4jgcsnHB8b5e5HQFC8V8=;
        b=St02usVmPdmhJsvOf6OsitnxA9ODtpLJPMtgV5g+Ejz4g8JYLa6k4RJoPjRdRgSMZU
         r84e6b7UL8PK+EBaJ8FsnRk6EnPWeDSzlGILik9jcp72z6arOMImbDOrRKYL/cizB3TR
         GlWAQObFZC4BA+Luf3Gvw2k7GxVku1qVViI5dnQzX0LFmNKorhyhCGhfR30LJRyebju9
         0f+Se01jFMTNIlNW+m+5ZjTe7mOe4shXdpZ8kQdImeKonl2AGHfnVDtrJ0BZTxCRskhH
         7TDB6wDaOxqJhmeSxfA8TtT7ahVhK0qv+d8ECnVVO5OFomFWazWZgXAMkEe1GlFTnY0m
         Fi/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782970775; x=1783575575; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0oea4DsE+/Fov0KykxRB5CSjwQYNH/nKviFCsjXURo=;
        b=dUEX1XwQvT/QdN8AfCFPVQwC2Jko2AjkB16mU7972uxpez3DU7B8YxFEecWDdtOD6A
         OcDfsUlrxcMXf17WvMwxoG9UYn4MZPGt6tO043/S+pAcOufcIGIlOCb7jmHV4wbLhnj0
         xOlhY8PSoGKTYhNcOWxCZjonH/YMmhuP26VR5k4CA72s3yzVPFiDzTya8d8GLQfqjPSq
         xaoqUiQzTjl9v4iMUPXIX683lmcjA1xchK6HlazyZ8iM7ERxVKW8poTivFnsd+Y7kGRH
         cbEYrtG8AM25zKLkaFM5gkwpgm89WOSDunioK/1uvyOXLZQ0Tb5DIdt3J8pB5MaLO9fA
         fL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782970775; x=1783575575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r0oea4DsE+/Fov0KykxRB5CSjwQYNH/nKviFCsjXURo=;
        b=Q6zt+dVJYWb4NQQmdqwKLuWmfwdeuU3s02jbGGYmSC4Fat1G3mB2w6uIKTku3ug1sc
         bvp4RWXWP3szZr8jVfoja8fb8YP3jb5HDmACxkdxrLRv4IDUsw1ovbY8KB7gTcsTNcZy
         QtpGjiUA+HrA9HbcMb+cohGjU0j316E6bMrTDgzPPsNuU5R7GBO4fwEn4r4U4FaNgBW+
         O0IoP9+EY01ByV0bBACXBzeLAvOzx1bvXh+TTbPZqCrUxjNsEI57UUc85uUWVePTznRB
         pBL0K6/t8ArM9EhPObqlXr5FLTqyL+XUiCcdAXw1ij3V7ZKgjYYHjMJWonA0JWH390di
         7o0Q==
X-Forwarded-Encrypted: i=1; AHgh+RquQsOMEG+7kEbtYeC/mw948fG6bDwlgR+PfUe51RokQmtsl7xB+4FHiDEu7TjpPLaCnjplX+1VJls=@lists.linux.dev
X-Gm-Message-State: AOJu0YytOPFshvezv0mS996WAh4LAXzAZ+vhebuyt9dj2hMLdPePphGh
	huNaZ3Kd1khB63yft67UrcfSndP6LF3EAnYDVSRhTFh4g8CUQxJ5Z6ih2yhn4LxO5zXrnc1w/Qm
	rg1Dqa/8knyrABt4QuJtJPgUtMlg6K6o=
X-Gm-Gg: AfdE7clqLBXRt8iawac45nq1vuy1R9fHaSHNci4phRujDmOp1/RrfeCCONjMALnCVp7
	JSHgeZ8TaWLmhflUNN5KomFl58Y/TxyKWjUBif7ZGtI9063gbKb0Mt8VIhxGTqe0SDWmzSraNFZ
	j88r6Jo3Ns/k8IJyG+8p80IGddZ5FKuQkSxv1QwP7BfMQCJIw/M+6QOj/1l2E584gE6k0HZdaPM
	0srOaI6tR9Rnc4ZKf7Ybw0l0F0ChuTTUKj9bbuf6y7dd7154zklFrf/Bsov4kbAe9kSHCFq/fdj
	f7ZqCspnmdiwcDhHBJqM0CQg+K83Hm7O8U4P+VDWvwJ367JlJxWKCmTlnmLNveZtMqH4x2a1xew
	Xg1bOnTzNwNWI2Q==
X-Received: by 2002:a17:902:e841:b0:2c8:be9:1d9e with SMTP id
 d9443c01a7336-2ca7e86485dmr47475665ad.34.1782970774733; Wed, 01 Jul 2026
 22:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702022108.17693-1-yangtiezhu@loongson.cn>
 <3fe115fd-8df8-4bf0-805b-2d0c2c40fdf5@linux.dev> <527b7e2e-e9cc-33b2-6a17-a888331a4d3e@loongson.cn>
In-Reply-To: <527b7e2e-e9cc-33b2-6a17-a888331a4d3e@loongson.cn>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 1 Jul 2026 22:39:23 -0700
X-Gm-Features: AVVi8Cef_t17V2Lu4bXkTa_xCxYiJRzZZA1gYJYB61h0hKWpLeqLSaO3rYNd5eM
Message-ID: <CAADnVQLaRRXQg=LuQMJpjkzqc63SK9bEP=DCGShHPrxH06mj3A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5] bpf: Reject programs with inlined helpers if
 JIT is unavailable
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Leon Hwang <leon.hwang@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, KaFai Wan <kafai.wan@linux.dev>, bpf <bpf@vger.kernel.org>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 8:31=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
>
> Hi,
>
> Thank you for the detailed pahole analysis! You are absolutely right.
> Changing 'u16 -> u32' for the bitfield group row implicitly changed
> the layout of subsequent fields like 'type', disrupting their natural
> alignment and padding.
>
> To address this and preserve the original bitfield packed layout perfectl=
y,
> I have rolled back the 'u16 -> u32' change. Instead, I moved 'jit_require=
d'
> out of the bitfield group and declared it as a standalone 'u8' field righ=
t
> before 'stats'. This elegantly packs it into the existing 4-byte structur=
al
> hole (at offset 52).

Your replies smell AI way too much.
If I sense it again you will be banned and all your patches will be rejecte=
d.
