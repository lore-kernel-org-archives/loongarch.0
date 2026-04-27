Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11032D9481
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276632; cv=none; b=SqiaJmf3rb6/4xakWjkLcmrZklTUCMhHhxLMQHTPCIoCdoYEFb/xPXLdrsnJ1hCEkPojSjgdafWWBn+P4WO3cEigkHto7AWxL0RvCu+sDr2BmyjFZAzrzrFk2XAYMuFdgnUja9PG2GlxouXRCbPH4DcwBkM66DVicnYPHHeGMcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276632; c=relaxed/simple;
	bh=h4nZoesTb6kiRbf7ldm39YHpiQ8BeQFf+a6IkRInlRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okNqFkWsJa/xJI4IdeKkOstca/pBw/6PbWlL+IB/SzSTaN6xlHJpFqLA/Eiog3/8YRX0YsuMVMRO+SIXbQrqUKFtZKFv6Cy04fXkE4pv+870HpssnunOCD8BGl2hVwz2GVunzkPaeTbAh1rQ3Fg3RE0qFUnp7qsjTLHOZX0BJfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+Ir40ba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+Ir40ba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B958C2BCB8
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777276632;
	bh=h4nZoesTb6kiRbf7ldm39YHpiQ8BeQFf+a6IkRInlRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M+Ir40baVRq+OyXuYePdvY/lWtKj1jsOmna+vgVVyuffxI0+LEbiWG963VZje8eiZ
	 AP0Bq/YMTU9WaCAPYXBgJtPSo4oBBp9M8jbHXHrJGTcrH+kSShzaShH7mJwa4MDmiC
	 AhyMhjN6BCaJs+75SA/dfhBhi6wTn/hVtrLsK+3SroOY6QWlOUFI2kjSJlneR8pIRv
	 rha/68YEXygX00+2Vqv4nF/Er15int/jd4/3vtJ6syvFiq/aiV1ePOOMLv9lYzZoDU
	 5p6acI15VTSUk5o2wQ1qgjOoX+O9cd2abZQEmTtpC9luEPPA5lGdCN8+trr+FqtAhT
	 FBJNuh2rBTo1A==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba9ad0fbc3aso868748766b.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 00:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+OVDtYtkgtcVGyUO5++8vu3eGCcz8HHxMFnZh+7o+9zh4e76qA6DdfbLN7TRZIEuqNQ4o9sTwUcXc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWFVJXU4TVeUenAyUb103TEh5CcdNunf+KxOsxPp8BbTZOCXJr
	xNN1Y+Sh77uXaI2bw/u0N5+ZfnTENhnHQeO3aMQo0W7rEvATcaY1jjhtO19L5V3PYc94OgDPg22
	cnq2CJ40WIgI1rcF15QJ2wV0OFuUjT+s=
X-Received: by 2002:a17:907:d40e:b0:ba2:e022:c146 with SMTP id
 a640c23a62f3a-ba41b3e451amr2080435766b.43.1777276630945; Mon, 27 Apr 2026
 00:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260414013114.306033-1-cuitao@kylinos.cn> <9c1462c5-85ff-4de3-bee4-d394ffdfb63f@loongson.cn>
In-Reply-To: <9c1462c5-85ff-4de3-bee4-d394ffdfb63f@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 27 Apr 2026 15:57:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7fgS6YPSLd6NrOG0YcFayQw-wNjKk4iQD0a_Cx1oJaNA@mail.gmail.com>
X-Gm-Features: AVHnY4IFzRdlQ8L62sPmeGGb_y6sy1OiBPRZVkdZoTH0J33rpx6X5LdKplM7Xcg
Message-ID: <CAAhV-H7fgS6YPSLd6NrOG0YcFayQw-wNjKk4iQD0a_Cx1oJaNA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch/KVM: Fix missing EMULATE_FAIL in ldptr default
 case of kvm_emu_mmio_read
To: Bibo Mao <maobibo@loongson.cn>
Cc: cuitao <cuitao@kylinos.cn>, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, 
	kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 9:42=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> On 2026/4/14 =E4=B8=8A=E5=8D=889:31, cuitao wrote:
> > In the ldptr (0x24...0x27) opcode decoding path, the default case
> > only breaks out without setting ret to EMULATE_FAIL. This leaves
> > run->mmio.len uninitialized (stale from a previous MMIO operation)
> > while ret remains EMULATE_DO_MMIO, causing the code to proceed with
> > an incorrect MMIO length.
> >
> > Add ret =3D EMULATE_FAIL to match the other default branches in the
> > same function (e.g. the 0x28...0x2e and 0x38 cases).
> >
> > Signed-off-by: cuitao <cuitao@kylinos.cn>
> > ---
> >   arch/loongarch/kvm/exit.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
> > index da0ad89f2eb7..3b95cd0f989b 100644
> > --- a/arch/loongarch/kvm/exit.c
> > +++ b/arch/loongarch/kvm/exit.c
> > @@ -390,6 +390,7 @@ int kvm_emu_mmio_read(struct kvm_vcpu *vcpu, larch_=
inst inst)
> >                       run->mmio.len =3D 8;
> >                       break;
> >               default:
> > +                     ret =3D EMULATE_FAIL;
> >                       break;
> >               }
> >               break;
> >
> Good catch, thanks for doing this.
>
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Applied, thanks.

Huacai
