Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBDC22129B
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 02:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952293; cv=none; b=lP6bYI1pk5f8fvSSLxU5Np1x4JGq2KEBOeVU9tgW8gpsjjS6ajX6s06k0TJBOyaAjP6GfjMhxSBf1t9hy3ndRdHw4c+8hROJdEJjDk7cdWUDTKvHr4koXb3NeMUZUPDZAg683JO5T3sEhOvBpAR4RR9QXf5SPPxtFjf7i1yDBWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952293; c=relaxed/simple;
	bh=gtUtYQQ5ThUv2l1cwoJGAROpSbgWqRG2S5VatDnKpeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRsahLLE4K9s7x7/8wkuU74xCwI6wjrgeA5qUIrXhvPmdJoYy/lQDr+ZXU8nGW/9w9dWsHWndTh7JCzFDukcv7h4IUu095wOkpbUpOU/bh0NP6RhAyvKBqYrZjWuJKvt6A+W3N+8t2SBmovY67vzUF9fGeHvzaoDJzZ5/nitOSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hazkt2wn; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hazkt2wn"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-435de801abeso104227b6e.3
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 19:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952291; x=1757557091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ED6z+k1JMbU2lVgAQbGDOb/Q56p1lzAkdaBUq9H/7I=;
        b=hazkt2wnKVjcmyppsWViHEJ8ly/k5fSB5/2bt89zuLWMX40WVYvCtaQBCkG6ACtqbQ
         4W0t3ryf3o8SDf6YRfFUmLswIUrqEaR7G7QHfcI4iqjNWjt6qijVCnXuycrN+4cDzihU
         VqbO7R4mAz/TOFUJrzOsENNp7Bhzl17cFLh4z+Gxd5jnmNMy0+/G3SFxaR6rsscYQ3pd
         Og272RDnfl6WjYqI3YJyaQwMEst3uUcMJ8QsVWu/+JPJTi0aawiQVNSYxj4Mta5+5nHO
         WvPx6cmYWbIGQqaTcSWs+0Ky4BoTtjedhjyBtwdjLX5nar6bI/Mf4r2fWYEJx3bI6fBy
         ht+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952291; x=1757557091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ED6z+k1JMbU2lVgAQbGDOb/Q56p1lzAkdaBUq9H/7I=;
        b=SuhQvCqjByCBvvHJ26PYZRw/k5J2TFVRr0ImYqRoAT1Mz0b8gwpnVzc9C2Wj54AgBu
         ZqTwAk6U2LqttIoMkqCmjSwf14VjP64H4HeuzMbjBcgnoZbNRatycdYjwEe1jv7er08A
         rSh0DBqb5ov+sncdhAec2uB6GINsh1P5GjsiTNN5G3d3fdnDM0EiEkVXzMS1n1W6WmZ3
         NZYGAFuC+434VPUyrtA9BQeCzAhEl+1nSSMggtRI9owIUt4OOZNAQQF3eEGY+pBOo65v
         qmdwD4lfckSuUbR3Re5TNI8a8sozvHm626XuAB7tx5Cnm2AqaLwMn2CZ8RtHNCVxfeQs
         KxFw==
X-Forwarded-Encrypted: i=1; AJvYcCUrlu6Re2cje+DpM3fsuXuXmYvoLd5P2CRAzHPO3YLQWxTjGzWfkZPN9GUj3C5jxF+QBSsH0DZwI9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmmtjQhAXYGBWLnYGnkbZJ43k6nIqA/CX+A3zNiHWQajKeRNU8
	mujXJYWZb7/WkLMJ/RIShSd6wfSH+6i4kSOP8ARQU3aMNtGYhP52icKDoElXLHOYzcm3FoTQAa0
	Ucj3LvWUd9XL6K0dFQ/fAdN09PLlJyZA=
X-Gm-Gg: ASbGncuhSEmrFwmTOmAJ9bR6fYFwb3XUfaEk2m1msZdZ27lqHzXJ8rZBz6Qq48iTnYd
	iZoXy2IFJSUgR4LNmYRe+yWaCerv5cSj5Wu4Quw+WJb0hkblOa/V/S7GGwhF0irbMevMIr+Xts7
	pG1cFtH2zf2vK/KB3sDkI5ZlFFvyKa3/viSZwWqglE8VeI9SkfZLgFeInsJoUq4WpRh9REpGnV9
	yxuUHQ=
X-Google-Smtp-Source: AGHT+IEjXx4bo+qNzhj7ga8ad3vpjEJVPo6vTEqWqcLxnPhivXwi0Q2C+D88tcEV9Hy52u4SFbqXqLTem4/x15aBaww=
X-Received: by 2002:a05:6808:30a7:b0:438:3b4c:c414 with SMTP id
 5614622812f47-4383b4cc5c3mr699615b6e.18.1756952290808; Wed, 03 Sep 2025
 19:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903070113.42215-1-hengqi.chen@gmail.com> <20250903070113.42215-3-hengqi.chen@gmail.com>
 <CAAhV-H5UUVYnM3TkKujvS2u99NTEK7VCQsVHZkAKzhL5o8jCXA@mail.gmail.com>
 <CAEyhmHSU4R1XRLy5O=OicvdAAzeSQxo-Hnd5Pm_FazApeydH2Q@mail.gmail.com> <CAAhV-H6nK68K7OBHg6+sLvHXjDdL-fP1aa2Fgj4C5M9dsDctdg@mail.gmail.com>
In-Reply-To: <CAAhV-H6nK68K7OBHg6+sLvHXjDdL-fP1aa2Fgj4C5M9dsDctdg@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 4 Sep 2025 10:17:59 +0800
X-Gm-Features: Ac12FXwHNKyXdBDiLtZdadfoTD1yN7LDGe-g8Cis6pcwYeFhR_sT-fBRweH741Y
Message-ID: <CAEyhmHQpNq=nDX-6FuRreVtmBDn6O6NTWv=PGZXDtEhU8symPA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] LoongArch: BPF: Remove duplicated bpf_flush_icache()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 10:06=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Thu, Sep 4, 2025 at 9:51=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
> >
> > On Wed, Sep 3, 2025 at 10:58=E2=80=AFPM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> > >
> > > Hi, Hengqi,
> > >
> > > On Wed, Sep 3, 2025 at 8:05=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail=
.com> wrote:
> > > >
> > > > The bpf_flush_icache() is called by bpf_arch_text_copy()
> > > > already. So remove it.
> > > >
> > > > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > > > ---
> > > >  arch/loongarch/net/bpf_jit.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_=
jit.c
> > > > index 77033947f1b2..9155f9e725a1 100644
> > > > --- a/arch/loongarch/net/bpf_jit.c
> > > > +++ b/arch/loongarch/net/bpf_jit.c
> > > > @@ -1721,7 +1721,6 @@ int arch_prepare_bpf_trampoline(struct bpf_tr=
amp_image *im, void *ro_image,
> > > >                 goto out;
> > > >         }
> > > >
> > > > -       bpf_flush_icache(ro_image, ro_image_end);
> > > Both ARM64 and RISC-V do this, so I prefer to keep it.
> > >
> >
> > Then they probably should remove it too, I guess.
> I think we should understand why they do so first.
>

Just got confirmation (offlist) from Huawei folk, we could remove it.

> Huacai
>
> >
> > > Huacai
> > >
> > > >  out:
> > > >         kvfree(image);
> > > >         return ret < 0 ? ret : size;
> > > > --
> > > > 2.43.5
> > > >
