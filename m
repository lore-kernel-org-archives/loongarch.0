Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E4EAD24
	for <loongarch@lists.linux.dev>; Wed,  9 Jul 2025 06:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752042854; cv=none; b=TBqU4Nal3Wv0+V4KkI6lpx5DcI+P9TZjEMDfyGksM3tWleNbvQK3eXJgjMQdRGXSaygPORxqAOOb/uEykNLYsFOOOAX3hwExcKyM/8w0OXL37VswmDbgasK7MUxo8GW8C7svJ75ucvSytWystkBHSKLWeghaWw68N+oH3fOEwnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752042854; c=relaxed/simple;
	bh=DMmKdH2LlUyDyDEWJ3r3ROcYn+v5xI+1H76HITCAuGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKGiEJ98ofWOp8n+CO4Ox8hu26e+d+O9V5LIh9mson+chgwpldl0QvkMO645D5aBism6YN6HfFoGunly+iUcP7Fq/+Tj/nWiBP9uFxXnSFDzLEcJ69YJTd6ZuEnxFIPwcpY71UM+ocgPnoSypgpwlABxLMKTZHXDvUjeQfhG8U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmmVJRcq; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmmVJRcq"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53140c33563so4505993e0c.3
        for <loongarch@lists.linux.dev>; Tue, 08 Jul 2025 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752042852; x=1752647652; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9aod6BXjQrO5vyW4mRKpBJMwKOe6N1K/J0C4KFxzP4=;
        b=bmmVJRcqAoKKitRcj82f0LWuEdlbhs2KyM6GYB4Su+83gwHAHtvja3RvWRGeBzcjAw
         qVxN9nlprvUS6LrQb5ie31QYtLhGUOqhXggvn5CCOMExjhw6G3Qg1Yy82//Y8IjgbV3j
         jU9p3/6CE8yd6+FA7+98hHEyV1PmrchopynhB8peOB59j3+rBHOpsH8arULeP659iXS0
         xAHhHVXeuQAhfn3axdFg6gbwzeCAMnH/dOTUij3Z1v1GXR1tBaKfbZ6Q2IRH3h+OK71/
         x/HEpNqiAr5b6A+PDg5GPYXQLA1QCzqjcgPV3wpLqor/0Fs4/kD6v+hRGzmRZVQbX8FX
         CUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752042852; x=1752647652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9aod6BXjQrO5vyW4mRKpBJMwKOe6N1K/J0C4KFxzP4=;
        b=klHnO2GrWiU1laaj72kqIIH3nF65GRO29GWtYt9W6vdqCAKe2jdnLNp5UQFwbuN1jC
         +jANLBDercI9MTNR+QZg9cG0JzGX2cWbfi1Y1bOmJ5sohSKClvNyAzAVecXZK/hGGyiR
         5doax43XDErr08OC0r76tI0s5YBggA0sRnweyv64s9f9eAQkPo4iTvdv9VcKBEa+pnTV
         N+3AkAYJgngZ0JnIm3LlcskdfEe4Tj34nqLojUXsM6wD4U7cJQIdksJFUIqmFv7HsKvS
         gYnkDHM9AfQ7delr9IqDyrIf41CRPppdTLEaK3azCRyxsvBqBt3OBJSHyEmZBLe/UF3Y
         1umQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7rtq5sTMzm2gX2J2cL2TE/hvfyMHDFIg2y6/bp62iKnCKuBbD0WK2Fb8VhTNVHJOlybN+k19smHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOuBVMHRXSb2z9O+JWTENfz0i74ZgOOTt7PoEcYYP2gXTARI3v
	bGWFyIRoydFSX1NYcy+3jexojgwCidmRao58stG9MGAQ3TvF7g4C96ijc061ngrpdCEhkMjUTH6
	W2xUUqEhnyfzZbR0s5kdpoO+qPYA0Oxs=
X-Gm-Gg: ASbGncsYEe2XuR4Sv/nBCfi+Iekv92xLRm48zRTLYcuJuZ2Le5U6RArkqIBFEp0eUT1
	Sg9sehR/Xun1j+hp5xYNSYAFdd6tsU1euM8kILZ3pyBQjjwBVhfpyg1OFjnAlzRMWMqMki2qfi+
	9yqHZWBlTi6TYtgpHpnyxpMqWGxKdcDev9fMABfYUwYA==
X-Google-Smtp-Source: AGHT+IGzn/x16pDQ53vI1j1ojRFLBVig/bMF+fcC23ilzSsODhT507fDhgyOaAudI+CHcvleaZ8z6iN2Q55SLHQEmyU=
X-Received: by 2002:a05:6122:80aa:b0:531:20dc:924 with SMTP id
 71dfb90a1353d-535d7443235mr586641e0c.11.1752042851298; Tue, 08 Jul 2025
 23:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2b83380bf64a424b9cb902a20a244c3e106c4bb8.1751702072.git.rabenda.cn@gmail.com>
 <56e7ec54-9820-4e02-be97-2a9e1dedd117@amd.com>
In-Reply-To: <56e7ec54-9820-4e02-be97-2a9e1dedd117@amd.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Wed, 9 Jul 2025 14:34:00 +0800
X-Gm-Features: Ac12FXxapUUsFofuo853oFqC-peo6coLRLtZLPkqC5w7REiJr3Q5hyQm71Fknlc
Message-ID: <CAAT7Ki-pg+E83xMCmES+VMWFthGuLMTzKdSbDak0OEMR6kfL0w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: enable kfd on LoongArch systems
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 6:12=E2=80=AFAM Felix Kuehling <felix.kuehling@amd.c=
om> wrote:
>
> On 2025-07-05 04:05, Han Gao wrote:
> > KFD has been confirmed that can run on LoongArch systems.
> > It's necessary to support CONFIG_HSA_AMD on LoongArch.
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/a=
mdkfd/Kconfig
> > index 62e88e5362e9..b2387d529bf0 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> > +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> > @@ -5,7 +5,7 @@
> >
> >   config HSA_AMD
> >       bool "HSA kernel driver for AMD GPU devices"
> > -     depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 6=
4BIT))
> > +     depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 6=
4BIT) || LOONGARCH)
>
> Is LOONGARCH always 64-bit? If not, please make this (LOONGARCH && 64BIT)=
.
Got it, will submit v2 later.
>
> Other than that, I have no objections to applying this patch.
>
> Regards,
>    Felix
>
>
> >       select HMM_MIRROR
> >       select MMU_NOTIFIER
> >       select DRM_AMDGPU_USERPTR
