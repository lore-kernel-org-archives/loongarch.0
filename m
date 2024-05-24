Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E2785959
	for <loongarch@lists.linux.dev>; Fri, 24 May 2024 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556729; cv=none; b=V5DACYSFDXxq8tM91HuoOO4CdmpkkVofBdAnWkYq3eYtM3dkCf1JB4GFu/CnAStl5LVCmkHkFuNigEZaRyPRm1SPIbkbMSYCD+X6pB3BiLLRt7sS2WzMkWaiJAJWE6uCG220OOVHZJwi7NlbJGh7sczQTRV+6OJWqP4SW02tIVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556729; c=relaxed/simple;
	bh=vZD5jP0xz4NBhWN8Zgsp2iFPrsWGp03cRwKrWdar1DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ft8S/BbaBz0DqAZof/XN5NFjwM2OrcbY3lOn8kWA0nZ29j7MmeUCZKZhsZ1C7KJ75TXb0xavLFkeN54O6+kM0FTgcWk743c/fekoDWkCS4i3yT3wNE4OZVv/PtAkg1zmw+tnUsvU6YVoJsMAxsXg2QqoLm6ifzZVud3yErZUbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWpTXfAa; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWpTXfAa"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2bf7dd49d3dso36782a91.1
        for <loongarch@lists.linux.dev>; Fri, 24 May 2024 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716556728; x=1717161528; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZD5jP0xz4NBhWN8Zgsp2iFPrsWGp03cRwKrWdar1DE=;
        b=mWpTXfAazwyZK0CnLZWPp7bZ03tzW81AQQpZ77xMhFqK7G1v7df2vBog+uRwK0SqQS
         ZM68QobBOF03K8j/P6RenibcCd9wEWoue/laxzKLofHZIzVvkmMQ8LiEZaHtgLKuwkpW
         aRuDD/EzHhJHNMukZJgH8NeXGtoUj/yJRkBr9EvrKeYjBiMO2hmDOq9RwKwDcRqY3TNO
         c74ax/QjxtYkNx7Dww/8ytyCmvxDadkUn7vHJ3vLOpAJ5Yhklr1yWC0kZEQXR3u7JNc5
         ixa0M72l705SlQM6kYgXXlrtaCbb+fnGgpkv3DkdFMBeHCuf6Lt3jVfw5REPKbtplouz
         b/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556728; x=1717161528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZD5jP0xz4NBhWN8Zgsp2iFPrsWGp03cRwKrWdar1DE=;
        b=VXEPP0Ck44iTl+R9kLiAjI/g+O0NhZcEiIqfbyIepRSmAocolOmAxs0HY5cUyjaqGk
         H/VS/q1qi5OuqQeavXObvZ/YSYuda35YU8MZgBZ427PZH25PH8rf/9SLoPovKVykWj5X
         yhFszqu2GwMa6lrxiq/+VlvQPpkxo6XEDR2OJQyJ9PBMJoAALURN1t1c98V+DUb0IbPg
         YU/t7PVqFJbM0FMAFU/7/F3ewOlm1NnBHSPPKUFd1pGzjSUXAa5cZ3+kqczHorY/YjYY
         V0ePdoYItnkgOh0NwJrOpFnvDkZyleCdMKrHClGj2BGWV1sL7ZRc13EJQrAhLbRj/3tg
         9QwA==
X-Forwarded-Encrypted: i=1; AJvYcCUpGyWlVn3nr/t9wmuvuxfTuSEdm8vX5TivqzjIFXKGoDCb0zrnBULVaxsYUo6pospZzA7eoLb+zA5LrE/95NMJpdDQ3rYSmZYi
X-Gm-Message-State: AOJu0Yyi8NjUNlrkUiX7evcFrqkkDh+PoPBuNQUHJa28uPkjvGTedzfT
	K8fWfiWOcNotxKDc32GeL2xm7GIH9Cc/g41GRE6/xCsMm8AJaTNpAPM8yrxqbzk5E3AshxBlpO2
	tntgNb3DDyy6aqSdYM4oV5VeX/kc=
X-Google-Smtp-Source: AGHT+IE8pCp8W5E13VNHTBajd1iiFRN6k3JoN7VIxHp3GdM/LrEcuL4DsERnr62fGGcgTS9Bh/R3Y3m/qNihJWl6krM=
X-Received: by 2002:a17:90a:c394:b0:2ae:346d:47cc with SMTP id
 98e67ed59e1d1-2bf5f715486mr2416381a91.38.1716556727885; Fri, 24 May 2024
 06:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
 <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
In-Reply-To: <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2024 09:18:36 -0400
Message-ID: <CADnq5_Ndzw5Gre=yyPKyFNX5yFWjTCMg2xqrn6tEj6h8t-nAYg@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Guenter Roeck <linux@roeck-us.net>
Cc: Samuel Holland <samuel.holland@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 9:17=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Fri, May 24, 2024 at 5:16=E2=80=AFAM Guenter Roeck <linux@roeck-us.net=
> wrote:
> >
> > Hi,
> >
> > On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
> > > Now that all previously-supported architectures select
> > > ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol inst=
ead
> > > of the existing list of architectures. It can also take advantage of =
the
> > > common kernel-mode FPU API and method of adjusting CFLAGS.
> > >
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >
> > With this patch in the mainline kernel, I get the following build error
> > when trying to build powerpc:ppc32_allmodconfig.
> >
> > powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/displa=
y_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_=
dm/amdgpu_dm_helpers.o uses soft float
> > powerpc64-linux-ld: failed to merge target specific data of file driver=
s/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >
> > [ repeated many times ]
> >
> > The problem is no longer seen after reverting this patch.
>
> Should be fixed with this patch:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/5f56be33f33dd1d50b943=
3f842c879a20dc00f5b
> Will pull it into my -fixes branch.
>

Nevermind, this is something else.

Alex


> Alex
>
> >
> > Guenter
