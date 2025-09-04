Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC41684B0
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 01:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950712; cv=none; b=ZVInBgqq2YgJsuV9V6vJmV5vi7aglGLLoB7beEZ3RCVFfPnCR4mlD7uIVa3bs2kTRIoV7g5C3VSksUoPamlixfiKC986egabxJvVTVaFGQqFEdDCMDQ8p1f26qqAzeKeU4Nckk3iC2nFfjgT2JSXb44zFjg2CAq/CYBsq01aDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950712; c=relaxed/simple;
	bh=1yQVy6KL8Wy7C67HxFNGJCAgN80a5g1uHMd0SJizcPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utasGaLVnEBWZbDZtscCQo+dVxaWPBu89LOc6FNJZ3AipoqwWJfItt518O6Tp8uKgk1A3wg7L1dj8vI8B1cTQwCPpWkEQPa2KXe4jQ2SDBas+LIL1dcSVcopgQSIdacGHD/OFk9ouXnrNK1iH7Ub41Qn26SCjck3JMUIdXD8heA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmMGTWqC; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmMGTWqC"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-30cce5cb708so413120fac.0
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 18:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950710; x=1757555510; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+ehcv4WqzfqIcfmWR6zW5Stl2bmeATexQZd5bH+eUM=;
        b=SmMGTWqCOVN4x3Kts5ez0QmXNJXsrGXqQCzjVtpHQbJ6q8BWOLrc83YyGArE+X3iEi
         l01iiuCYIbjCbdSfomG8AxyVpL85EYRn1COq720I6UbKHa7nR877zwAe+DrKhV9c90wz
         wJD08aTL/bZuUi7rZv3E32S1WoUUnz89+ongDkFBKSvgqmBMWszz1/uVE5wNMrOC0ovR
         /ck8ougnuQKQ4UMZvpnC+JjBnuXKnfCO8s/GzyAk/ZX//azRFD8aTN6hiwRs7KhSQGHn
         7Z+xRRK8wa5YE9eqrpdPOE/9StRWTB2oAn6fuVcDRMHXGCXgEmIiFUsvCnqXrIEDjSA2
         +v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950710; x=1757555510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+ehcv4WqzfqIcfmWR6zW5Stl2bmeATexQZd5bH+eUM=;
        b=DYgfmluOAvLA2rdqOfxtFKW2mnunsixxAfh4PFTvIHfXTaMWg9lWsvlt3WeAGxhp8I
         mXV1T/NWA9rpVNwpn6gkvE/60Br5/uqM/oIHHa9zTb4uI6oIY8I+jJOK/y2LFUGtjzD9
         R1OinNnpfFWyApApSbnQcoD8tTjijtH73lP1SzphLOBpQNUQAEt2ZpNPs0JIGrqfarK2
         NeC3sp6Zwe1itGPGkLkADHvMyOL80cBYtw68FUaRZvngf1wwuEkt442hGTdNTLSOzc1G
         vP1tKhHjpcaSCuU5c+jyZsCtAM9NRmU8WJNSF2pURuqs5ZXdD8HHgixG/zrZW0F9TdoL
         TK3g==
X-Forwarded-Encrypted: i=1; AJvYcCWLLjNOf9BleexP7pwpFAE4NePDBVSqElTOafI06v0/56uV0dKkv90YXTmtuQGxvC+T+JZi+l0d+1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YztLYAw/7A/BNtynR71TXB5TbUQydxEiFQ3h0ZAKs1GRNJqXtUa
	YYY9QGEi0OSz14hdpxrF4WJjfKte/590v7bA/K2kTHT91LlBpSz4DoRLmP5chYVLHihc3JXlulM
	zadlJgT/MZIFg0oK/Gp9ImAaloldkRc4=
X-Gm-Gg: ASbGnctiw6LRu65VWxENldE7qEx++eh7HQwpArwXsjV+WihY2fOQKUxbPR2pc9V4vXv
	Uqompl3uJcx+RBaYTjDA7y7azH/jN5MTyyM1KBLSf6mj6/o8N/dkQuFYcwG6DXKooDf6AhctibK
	UnBbVdo1no77ykzvxz/IPwPvOgbZfpFbTBjsyDTcdcDL2mQBoHVqhyF4HYvnhC0zLOQSBwpTAVW
	u/fBna7boXvUDQ2cQ==
X-Google-Smtp-Source: AGHT+IFtoiAM7ruilXBBd9h3o6f+PVRNXCZLkBzgaUWE+nKkKvOoOromMi7KR2TS6MV5gBVECj/3IwRpUdMhuyraWFs=
X-Received: by 2002:a05:6871:781a:b0:30c:92a1:64e6 with SMTP id
 586e51a60fabf-319633df0abmr7575347fac.42.1756950710085; Wed, 03 Sep 2025
 18:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903070113.42215-1-hengqi.chen@gmail.com> <20250903070113.42215-3-hengqi.chen@gmail.com>
 <CAAhV-H5UUVYnM3TkKujvS2u99NTEK7VCQsVHZkAKzhL5o8jCXA@mail.gmail.com>
In-Reply-To: <CAAhV-H5UUVYnM3TkKujvS2u99NTEK7VCQsVHZkAKzhL5o8jCXA@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 4 Sep 2025 09:51:38 +0800
X-Gm-Features: Ac12FXznlh4p1q7GydLiq64gmujxhra8YEXFolkZImPgLjkCqe_kOXTaTo4PMQ4
Message-ID: <CAEyhmHSU4R1XRLy5O=OicvdAAzeSQxo-Hnd5Pm_FazApeydH2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] LoongArch: BPF: Remove duplicated bpf_flush_icache()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 10:58=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> On Wed, Sep 3, 2025 at 8:05=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
> >
> > The bpf_flush_icache() is called by bpf_arch_text_copy()
> > already. So remove it.
> >
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 77033947f1b2..9155f9e725a1 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -1721,7 +1721,6 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_=
image *im, void *ro_image,
> >                 goto out;
> >         }
> >
> > -       bpf_flush_icache(ro_image, ro_image_end);
> Both ARM64 and RISC-V do this, so I prefer to keep it.
>

Then they probably should remove it too, I guess.

> Huacai
>
> >  out:
> >         kvfree(image);
> >         return ret < 0 ? ret : size;
> > --
> > 2.43.5
> >
