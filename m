Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB12295531
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753945942; cv=none; b=LqZRYNmkHgUvxrxE/eO4TpgCQ+2tSvc+m4Q24aa4EiFOF0faXnfjlHdF08SUrsOiDuJhpM60Q4l7Ty0RUd8Dl0hkaDAL3aeddPSjtoTIqMJyFVbmi+Y3c8m8GDa0WMFIaFTGEJprdJp/5vWZg+ZxmHxlmFkdkJsKFgsPdAFr4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753945942; c=relaxed/simple;
	bh=a+xHukzxRgs/rss8W96lyEJe35XG0W1n2bm7t0wj9dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFQv8FOfEn6k3fCqP3gkyTYgYJunvjmiZy43l4ZSxy+p0QfIJCT7P/m7tG2ns6Xdx4M95z9a2gdEu1mY1y3DmRSSeNCVT5CcHvGJAKYVXYURDID7+N5LQtEaZSoHDuLpctgFaTuXgSsNS7Fu6cL4Ml/uFRah7h2Tp8fPz4BxFAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ettOLP3j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ettOLP3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC46C4CEEF
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 07:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753945941;
	bh=a+xHukzxRgs/rss8W96lyEJe35XG0W1n2bm7t0wj9dU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ettOLP3jvJDV/uESWDMyDHAe7eaHWg7VHfowVCMvy8CIXtK+KaSnpMTlVnzUV1xaw
	 1qcCSojDtflYSFQwbEXeeBjK6fTzsjymng+7+2xN1JOrEwv2n1QLrtKLk0rZZxqOaB
	 eS36cD5KqJb9tupZ2jJM1Ncmzfi2jeanNi4aYIMzv2Qx83lQmSp6b7XN8PRFcVbYfx
	 cWi2JZm3jQNDzO0UerPLlni9JDcBeTTYb2fme1K+wyw16tKN8Sm5FcZKId4/n5Rwk5
	 QPCwrrbdZE2AkKDO85smosRqJ+Y56llRMqGzHNd6Y+B2G3evn8vvACnG8PWQAeAPGH
	 rJosnmIxhQjQQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae401ebcbc4so10473666b.1
        for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 00:12:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9fAQrgpJeFEoakjQ9brdOswHJ9QP6sJgiVkXvOUV9VX9GHFcgr7On31uxfQdfL4GCLDgyICSCnzY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEKAe3lCQAGlySbeof6RsSAYqqzdtC8/hBfnj/HVLPkfAxIJiH
	gxm66/tBcbUbXYXhNmlC2HM/hsEacfjyqDV/ZGyx55CVNa7HGgSFyaE8cPxwOVAosT9HZCejfSs
	Bml5heNX+PLX9TCdxraUS51+mLLOyl4M=
X-Google-Smtp-Source: AGHT+IH0P2lLYOyvOQx/GU1OTqxpktOyFDmxeoT9gk4gipfEZfCNP+byqLnd2/DhVEg4bNwecB0IeZcFujbLdfOQFUw=
X-Received: by 2002:a17:907:86a6:b0:aeb:3df1:2e75 with SMTP id
 a640c23a62f3a-af8fd9b9e59mr685307966b.46.1753945940115; Thu, 31 Jul 2025
 00:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250731064813.1622-1-tiwai@suse.de> <20250731064813.1622-3-tiwai@suse.de>
 <CAAhV-H5p6-oHtbbo_9P8oZJogZTxgeY2cmc0usuefZBmE-4buA@mail.gmail.com> <87wm7osurw.wl-tiwai@suse.de>
In-Reply-To: <87wm7osurw.wl-tiwai@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 31 Jul 2025 15:12:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5TC0jYbqu2M0CXEJ+80Svonrg8VHOF-ygb=ff7kWHX6g@mail.gmail.com>
X-Gm-Features: Ac12FXycyuppluWyhvn7X-gl_son17HRBqi4ZmcvmcdEtiT5O4L4UwNb47BU84E
Message-ID: <CAAhV-H5TC0jYbqu2M0CXEJ+80Svonrg8VHOF-ygb=ff7kWHX6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] LoongArch: Update HD-audio codec configs
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 3:07=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 31 Jul 2025 09:05:04 +0200,
> Huacai Chen wrote:
> >
> > Hi, Takashi,
> >
> > On Thu, Jul 31, 2025 at 2:49=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wr=
ote:
> > >
> > > The HD-audio codec driver configs have been updated again the drivers
> > > got split with different kconfigs.  Add the missing items.
> > >
> > > Fixes: 1d8dd982c409 ("ALSA: hda/realtek: Enable drivers as default")
> > > Fixes: 81231ad173d8 ("ALSA: hda/hdmi: Enable drivers as default")
> > > Cc: loongarch@lists.linux.dev
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > I prefer to select all Realtek/HDMI codecs (except
> > CONFIG_SND_HDA_CODEC_HDMI_NVIDIA_MCP and
> > CONFIG_SND_HDA_CODEC_HDMI_TEGRA).
>
> OK, I'll refresh later.
Also for the MIPS/loongson, thanks. :)

Huacai

>
>
> thanks,
>
> Takashi
>
