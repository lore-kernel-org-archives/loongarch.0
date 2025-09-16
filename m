Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A07A29ACF7
	for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017078; cv=none; b=VNOnbb6gXX5gTf5uu6T5vSvun4e+fp9ofTyfyZLMjh+Gka22nr8G7xxcYhtGivw9dtGczCcKJnGc9/I0j3pmzpoD4fuNFM98AUM8xVpMypJNtFxAE14L/IKqcnTbh8PzJ1iAZoMbXH7YldnELomS5Bz4mJbtt/aYzJ8U2vcGQbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017078; c=relaxed/simple;
	bh=9QDWXq+ckM2Own18uScrRB4h421cBu6n7SahYyLtGS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPyuiBRFXbD8xMp4EtmAZPjNpU+BeSM9VBpQhi6olhZGGBlAW44xCEqZwzH6Dconc7VDUAqN1hrE1dn7OmscHf4LCo9a++4RrIl2BGbS34HFvkYpTpecPYmSWh2+wYwlurj8oSCt+Nk/KZlkpIUjSO3mAJ8Av6fFCuv6cf5vAzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/grl2jo; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/grl2jo"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62f1987d53aso3277396a12.0
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758017075; x=1758621875; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xvq0oFtPmi38XNhelZdp7JrUmNikqA6Z70LwGViEgDA=;
        b=Z/grl2jozBcb5IK9YPfLc+oEzyKDKL+84VPYcJQMTFxAJdQGrlYcIMeJekwRlmDLoN
         5OwfaFgsJPhPxTFFrqcbpneZTdJMrfC3Cn2/QBGbcupDbw7tRv9AejjNC1YNakPt3P3B
         8xdilLp2Y8mjIyJfdhqCElHzHDAbPP+t6B7rtSsDpUsAx1aTuD7H9ilCX08+S+w2Z5cR
         GNU0L1um22wVo081jQTrPnKc6EvRbYHbjuepf5xJoGWXjrDCyLtghcoq7woWNXVAhqQ+
         JEy9YXs0m+WcKtdFF11z0cJBl1GteLJaINoKXZnyTVy8fi/7LM9WXAld6DH6r7j3xaSf
         YhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017075; x=1758621875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xvq0oFtPmi38XNhelZdp7JrUmNikqA6Z70LwGViEgDA=;
        b=vKdoCDIMuXszbxK6LDFd06nPA6FRywVTDRCC1nE8tAZQitrvzE4peRI9AA+n3kWKYX
         8ROIrFeupRudw6AOiDfOVurMRTZnjUNS7uomU5gzoxvIDPt4glMnXV2HSWkLV7kHyHLX
         KvN5uEtRChOfc8xDA9NiD0KiWJo1UsI90eSz19KT4xhFV9el/2B9BN5Zhz/zjbDIG4JR
         fAik9YsTI2F5Jiv3FgI4UTT/AEnxZ07Y5P+j0k6ws37PkRg0rXomhjbL45KQ3+CwdGt6
         AS4YKBLES9hV1OgdyTTZXDA+34+gXG55fObyWd6lhOe5f6HPyvAWZzjD5OEojI1qy1DL
         7nlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn0wbYhY23iGkk7OH6pUSWWwIIQPOlNArzQ9rdcP31rjUW2SYo/Cr4BPgZAdbvX0QHM94bCJJKXaU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoiilTxGF1xwXEzZ/SGWxcOxiaa+6QuraDRUtuDMOI710F+AtH
	qpLZvbdYIAXaoYyh++z9P2g4LWF11ZZFUNKNg9L9jzlbT8cAdDk31yKI+VUF8u8iG1eni21eZe0
	Cp1k1m81sG7NchuxVsU9JTwIkttDk/x4=
X-Gm-Gg: ASbGncsnnjbxy3LYIdPJtBypWfw3RajX6CV33rcVonmNbEVwScx9Lm1NtXgx9LO+zKM
	KCRtrujF5o2Yrn31RRqnby8IrPlOiEFiuw4NUJSaSjD49BNyLNsKluNsC/pKZK98anZWktXJ/qN
	n2ueh1gT3AjbShxQ+ohl3zeABfJrKN0603paezu2aLEnRi/zD0wlvN4rPC1ToYBpeT3U/XJNh1I
	Gayqbo=
X-Google-Smtp-Source: AGHT+IEPxRjXpipLqO1hanLT4Es6XaecDmd6j0Gs7/wn2Tp86zqgVa2ychH1gW5ousYZhRv8X6WtLF5xIPq0D+5VGFU=
X-Received: by 2002:a05:6402:1e93:b0:62f:2afa:60e6 with SMTP id
 4fb4d7f45d1cf-62f2afa64a9mr8308237a12.7.1758017074551; Tue, 16 Sep 2025
 03:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756987761.git.zhoubinbin@loongson.cn> <175760122164.1552180.16853979882678693472.b4-ty@kernel.org>
 <CAMpQs4JbQU3D-Bs2687BXSC=FKJBS6RMvWAKb6AJEtzit6hWqw@mail.gmail.com> <20250916084002.GF1637058@google.com>
In-Reply-To: <20250916084002.GF1637058@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 16 Sep 2025 18:04:21 +0800
X-Gm-Features: AS18NWANjn2G57nOU62SNxRQ6bZ8lIjTtYZPiruAZN2iRv_YMwXDLOAyZ_D0zcI
Message-ID: <CAMpQs4+J2zYgZaGYBSaf4UwzKZY-qMoD1oe2vmgJQXAfghqu=w@mail.gmail.com>
Subject: Re: (subset) [PATCH v11 0/3] LoongArch: Add Loongson-2K BMC support
To: Lee Jones <lee@kernel.org>
Cc: Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	jeffbai@aosc.io, kexybiscuit@aosc.io, wangyao@lemote.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee:

Thanks for your reply.

On Tue, Sep 16, 2025 at 4:40=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 12 Sep 2025, Binbin Zhou wrote:
>
> > Hi Lee:
> >
> > On Thu, Sep 11, 2025 at 10:33=E2=80=AFPM Lee Jones <lee@kernel.org> wro=
te:
> > >
> > > On Thu, 04 Sep 2025 20:35:04 +0800, Binbin Zhou wrote:
> > > > This patchset introduces the Loongson-2K BMC.
> > > >
> > > > It is a PCIe device present on servers similar to the Loongson-3 CP=
Us.
> > > > And it is a multifunctional device (MFD), such as display as a sub-=
function
> > > > of it.
> > > >
> > > > For IPMI, according to the existing design, we use software simulat=
ion to
> > > > implement the KCS interface registers: Stauts/Command/Data_Out/Data=
_In.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > >       commit: 67c2639e1fc1a07b45d216af659c0dd92a370c68
> > > [2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > >       commit: 2364ccc827e44064e9763f2ae2d1dcc5f945fdf3
> >
> > Thanks for acknowledging my patchset.
> >
> > I can't confirm why you didn't apply the IPMI patch, but this appears
> > to break the patchset's integrity, potentially causing missing Kconfig
> > dependencies (IPMI_LS2K select MFD_LS2K_BMC_CORE).
>
> Pretty sure this doesn't break anything.
>
> What build errors do you see as a result?
>
> > Additionally, as Corey previously explained[1], this patch can be
> > applied through your side.
> >
> > [1]: https://lore.kernel.org/all/aFVtNAY4u2gDiLDS@mail.minyard.net/
>
> We only apply cross-subsystem patch-sets to a single tree if there are
> good reasons to do so.  In this instance, I can't see any reason why the
> IPMI driver cannot go in via it's own repo.

However, there still seems to be a text dependency issue. The IPMI
patch modifies the MAINTAINERS, which depends on the first patch.
If the entire series of patches cannot be merged together, does this
mean the IPMI patch can only be merged after the MFD patch has been
merged into the mainline?

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--=20
Thanks.
Binbin
