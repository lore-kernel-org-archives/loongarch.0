Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A68D328611
	for <loongarch@lists.linux.dev>; Fri, 16 Jan 2026 01:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526124; cv=none; b=uOSzcm/gTBPwVxTtwW6OzJPJfz9UpXQmRSXTQ1jy9N3c+dbY3g3MJlkzsjhSqFPtPmypxCXDDEBzehFbW5ZWwRmGfrrDXULfcbgTf0b6X0fbuoJDFsIdAusdD/LqE9NFG+rfnmFYCFKkytfTlKVUnYOGeChCkg2U4H5qe0VoV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526124; c=relaxed/simple;
	bh=ROU4R67s950GbA7GHKQWHktozeFvbhpGduCMWOOF/Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thrIuQRnDZgSOpA8a/acRrKxLO9KroLy/AZEiy7zacbUbRd1msIOSVXHEqIFeaa8GIv2o9zgEVtmfm8QuezxCxmND1K+aKjvbmfzsykNEkptYNQ7iv+kFpT2euxiyXHzQwCTXV9ZkGBak2YplE1BEjIEAMMgkPVRK60iKDFDap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0qy/1zd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0qy/1zd"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b58553449so2621165a12.1
        for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 17:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768526105; x=1769130905; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS5A6hdws9JgSg5NdQLN8SLz4AQmGLJR4UdFXen0ylY=;
        b=A0qy/1zdCNlGmsLY10wnsvPofctS40TTe6fpTUlBc7WQ9vbbFZtrLGYZpsGChbjU08
         ukfp3VYjKTr6XITQBIiNXM4XQgWz/MkrArJ5iNMCxi+EP3J7Z9my+MUF1ct+QiaVxePY
         bSnvO18iJqyOR0ld5y4UPtEIFgUUJGICbyrj9u4shEZN4ZaoXyhQEN3IflN7YXvapMpp
         F7D9KCeL2r/8mOu5D2WyKWt+f1qhba2dMMLDddcq7h6EELeFAUtMm/RQRvrCNpYb0cre
         ikzWzwbWqwDPLGGyy2fAr8Q/MtIOsf31C4K8IhkzND8LZjXtcxXY7C56CRPNlullowlc
         zUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526105; x=1769130905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KS5A6hdws9JgSg5NdQLN8SLz4AQmGLJR4UdFXen0ylY=;
        b=uKFQYJUzQ8NwF3tCdyYZMMTxx0FWR6Pe3JRyfkiB2Lrl4p8wEqYFYDcyUOqnt3GI+i
         ZFugFTkchEEOC4MvtU2h9sBG1CKdhvstbn/ofyRab8PBiZZGzyvGcx2U/XQMGogSp+/t
         2DKEMxYB1MP8i8pHowd9T6SDa2R94/ZUAlWY96uxkm9XZyvYEaWib7vA803H+sAF+tFj
         Wfc5VI1bCBpfR7Q80vRSr38Um2dClolQ4Hch2jvDmf9AB3KAskajaw9i4UxLTZQHOK9z
         8n3TFjHeGlCOynag/d8yg1LCHq8A5PcCP15NwyqRE8v4P+0qm9jsND3uQ4yAT8eSUOxC
         3SaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6g4t66qhsDrvYlfdR4K3c8z3lRiUHDrnV2nDo4YzEsFZWnnDkVM82TgvpsJY0I+Cp42Kk285DHic=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsgadss4uJOtg0Cve0euELWKiZcxbcj6lkGjZKhxBoR8rqHn5E
	b5A5FkduQu2f3R009K3w2P0cI1zp7nU0ZZqzCO6/XJAfrpFZrV58I1+pcVT3Johb44OjJcyz+uS
	hCl7qeUVohH5SpBiSRKS5A9tRm875soM=
X-Gm-Gg: AY/fxX6UFvFK8jn03RdSLYI2nrLwsw2B82PZ5MLZ1tZ/iFOHqmK0FzAbsOGfrCy+hUl
	qYRRAefJuwP8DTg6W9vJOgJfYqRvSQnFxZqWIJ2VE67+kxSGMGY1s5frJ5b+8FO3PyxT6dCnx5L
	UjH+IPLopt8PeFvolG2n3mpqEtF/1Ve1TX2kdPBEoAbwcFFPjRagVkQsQnjmaDONjJKFG7V2taE
	vCHMTVZnS6orvU0MvoBJPtAaMMHenzi5S/HvVYJ5fNX5z5pzTyu7+oJjIl/boMZB3IEs7f4MJCR
	OT8W9Bk=
X-Received: by 2002:a05:6402:51c9:b0:645:1078:22aa with SMTP id
 4fb4d7f45d1cf-65452acb341mr974597a12.19.1768526105360; Thu, 15 Jan 2026
 17:15:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn> <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org> <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
 <20260114205855.GA3190839-robh@kernel.org> <CAMpQs4+v=KhLW_Cru801p06vmpjJFotvyDfKBALg6mbwxFU5-A@mail.gmail.com>
 <CAL_JsqJVD3o41Zch6fMY6s-qmyd9cQg6CJ+iya+3kdtuqvNMoA@mail.gmail.com>
In-Reply-To: <CAL_JsqJVD3o41Zch6fMY6s-qmyd9cQg6CJ+iya+3kdtuqvNMoA@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 16 Jan 2026 09:14:52 +0800
X-Gm-Features: AZwV_QhUFfli37YKjCtOZoZJEFk_EN3-i1wZz_UWr78liB25i8-qldPEHYjcGIE
Message-ID: <CAMpQs4JuGXvNA+gbo3LHeqEw+JZ2JNnmgfLZZQNV+A62e+psdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your reply.

On Fri, Jan 16, 2026 at 1:00=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Jan 15, 2026 at 1:39=E2=80=AFAM Binbin Zhou <zhoubb.aaron@gmail.c=
om> wrote:
> >
> > Hi Rob:
> >
> > Thanks for your reply.
> >
> > On Thu, Jan 15, 2026 at 4:58=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Wed, Jan 07, 2026 at 09:22:41AM +0800, Binbin Zhou wrote:
> > > > Hi Rob:
> > > >
> > > > Thanks for your review.
> > > >
> > > > On Wed, Jan 7, 2026 at 3:13=E2=80=AFAM Rob Herring <robh@kernel.org=
> wrote:
> > > > >
> > > > > On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > > > > > Add "loongson,ls2k0300-rtc" dedicated compatible to represent t=
he RTC
> > > > > > interface of the Loongson-2K0300 chip.
> > > > > >
> > > > > > Its hardware design is similar to that of the Loongson-1B, but =
it does
> > > > > > not support the alarm feature.
> > > > >
> > > > > But you are requiring the interrupt property for it? Isn't it no =
alarm
> > > > > feature means no interrupt?
> > > >
> > > > Yes, the `interrupts` attribute is not required without the alarm f=
eature.
> > > >
> > > > But my judgment condition is `not contains` (added in patch-1[1]).
> > > > There are only a few SoCs on the Loongson platform that don't suppo=
rt
> > > > the RTC alarm feature, so I think `not contains` looks cleaner and
> > > > simpler.
> > >
> > > I should have said allowing rather than requiring.
> > >
> > > You are allowing (though not requiring) 'interrupts' for Loongson-1B =
and
> > > Loongson-2K0300. In patch 1, you made it required for other platforms
> > > which is an ABI change. That's fine if it was a mistake and is truly
> > > required.
> >
> > Emm, it's true that for the binding interface, Patch-1 is indeed an
> > ABI change, but it's more of a fixed patch.
> >
> > Throughout all existing Loongson DTS{i}, RTC nodes decide whether to
> > include the `interrupts` property or not based on the alarm feature.
> > Loongson-1c rtc nodes do not include the `interrupts` attribute [1],
> > while all other Loongson chip rtc nodes do [2].
> >
> > So, while this is an ABI change, I don't think it affects existing
> > Loongson DTS{i} rtc nodes. Also, it more accurately describes the
> > features of the corresponding RTC device.
> >
> > Therefore, I would like to clarify it in the Patch-1 commit message of
> > the next patch version and fix the error in the commit title:
> > dt-binding -> dt-bindings.
> >
> > How do you feel about that?
>
> That's fine, but you also need:
>
> else:
>   properties:
>     interrupts: false
>
> So that on the 2 platforms without an interrupt(alarm), 'interrupts'
> is not allowed.
>
> With that, you might as well just drop the 'not' and flip the 'then'
> and 'else' schemas around.

OK, I'll fall back to the writeup in the v1 patchset as follows:

if:
  properties:
    compatible:
      contains:
        enum:
          - loongson,ls1c-rtc
          - loongson,ls2k0300-rtc

then:
  properties:
    interrupts: false

>
> Rob

--=20
Thanks.
Binbin
