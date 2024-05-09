Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C598AFC12
	for <loongarch@lists.linux.dev>; Thu,  9 May 2024 01:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715217043; cv=none; b=S7nvif++m+BJm/sBOq5JL5oXr7XK87cIfDcFsr0yp4HP4ghaneu/jtDTjSngJX1A45RpgMQWA/ufR8CmeV7OJ6A70dkDvR4fJvcMWWC57mJytPInnko0RfrdW1Kjm0Q4EoXtbhlK3ryVCULHlMxflNgphT8q7ZRd64swLPwIQTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715217043; c=relaxed/simple;
	bh=5s4453ri0t/LUDdGgzWfdUHbA1UcXjk0arUA2v3BwLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvXQDo8fLGPgZai8SllujntN1iJ6tbKtIIYdS7fgH70gs2sJLNxVYrTvxlqNbd+XSKV/ZAAsSekudYzPl59npUNVF/TaoaNfKWUe6iuqZvxdYR16k2DUwf/RIxhww7xMTxYzQXbq7iGhVM8ZKzeQFKwxnW+6zRZzs88jasnfgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpKXR55K; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpKXR55K"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61be74097cbso3602027b3.1
        for <loongarch@lists.linux.dev>; Wed, 08 May 2024 18:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715217041; x=1715821841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNoB9hp+UBqBvM+d/hhgzdG/cm3lBfAwJf8PWfwYx8c=;
        b=CpKXR55K4K7WPTvqSGqS76bvFAzJzUx2whHtll7yCPs26PO0D5lpeKniyyOAwaVl4+
         oEt5WbvyqusP3Eg843tZu4XdtJs87Fwua0Yxl0bpNRWThC9fyQj4mnj7N8R5weRkSNUA
         Ln+jBRCRoylwcfUjEhtXXiLIZqONVQmIeFopqW56hJ9xGYPL7jTGg7rSJjgpqX6g3TcR
         d1vmpTF9Szx+Krz33kVjWwQgttl5owu8f3TnyIf6HvaT7bGH8dU+9M4nvDsHB1Muiy3z
         uekoi1va3zZ0su4oQammTeT7R8SYPvmKtAFuMMlcBqkuq76WUeEg2LiR12iJsr95ZEkk
         uXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715217041; x=1715821841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNoB9hp+UBqBvM+d/hhgzdG/cm3lBfAwJf8PWfwYx8c=;
        b=Y2vCUvMERiQ4eA/yh/zH4ekseDx9NosT+V7Ixc+QhdVzlOg/H+HT6oBGgoMUcu+3k2
         sD8r242HhbWzZMCOTLo3UhjdeIu3c/PT11OCgmvNW+OGO8Ew7/qKLaER8dQiiwxjYS5a
         JAG/o6hsHkLMrevyRrwVdl4fMHqIpji8cswwOpXj0qoyvV3nmVdGK8ACCMd3Rfs9MKbb
         qVV8cUWH9Q4RFqHCbYvDJtKQmefTV8luAhqc7XHns7yn2H5LW0VcUjYos7hucRt3c1n0
         XLYDbZeWUkrEditjLzZ9F9btVarL6z8p3kozsfC4aCO6I0iyC5t8+97SKx40Eh3xSc24
         l8tw==
X-Forwarded-Encrypted: i=1; AJvYcCU86JSkU7fBGNzKkoBifbpGAdFflQv+j5tvufKukLNFkIjwAehms8UH7eFNpoT9IJqFNen7llLb7ALAC4zUT5xD1QDpCJVezcbd
X-Gm-Message-State: AOJu0YxByMYdNMJu5EcPXHG+pUFFTJmoWdng1/5d87vpLoBXdlrx0Ndz
	8J/qEFocKLP9AdhCDdXSFinHvDYUMWK9yxXy8LSmrvHqRIAcG36QpSvbzPZcE79IDn6cqbju9ka
	Jjsw6RNuO5Mm1pVVC+n2rqJ+vDYs=
X-Google-Smtp-Source: AGHT+IFWwh49cZI/Q8tBweaDC++8NhoQZwewekFVmONePoO0D7b745VQX/CxIVEkAlv4rNKhFsGGgCWBXsO79KJtqGQ=
X-Received: by 2002:a81:4fc4:0:b0:620:50e0:c32 with SMTP id
 00721157ae682-62085af01c1mr41535147b3.36.1715217040642; Wed, 08 May 2024
 18:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1715156107.git.zhoubinbin@loongson.cn> <d0b25dedb43c000faad5b86cd0512dc6498e7839.1715156107.git.zhoubinbin@loongson.cn>
 <20240508-startup-oblivious-d864191f524f@spud>
In-Reply-To: <20240508-startup-oblivious-d864191f524f@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 9 May 2024 07:10:27 +0600
Message-ID: <CAMpQs4JyLSGKVWPzej39Rq0G_Z2QmJ0S+y3bMruBm4tO-ZWq+Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] LoongArch: dts: Add new supported device nodes to Loongson-2K0500
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 10:26=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, May 08, 2024 at 04:29:10PM +0800, Binbin Zhou wrote:
> > By now, more Loongson-2K0500 related drivers are supported, such as
> > clock controller, thermal controller, and dma controller.
> > Now we add these device nodes to the Loongson-2K0500 dts file.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../boot/dts/loongson-2k0500-ref.dts          |  4 +
> >  arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 81 ++++++++++++++++++-
> >  2 files changed, 82 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loo=
ngarch/boot/dts/loongson-2k0500-ref.dts
> > index 8aefb0c12672..62dad6297e82 100644
> > --- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> > +++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> > @@ -41,6 +41,10 @@ linux,cma {
> >       };
> >  };
> >
> > +&clk {
> > +     status =3D "okay";
> > +};
>
> For most devices, doing the "disable in dtsi, enable in dts" approach is
> the right thing to do, but for things like clock-controllers or
> architectural interrupt controllers that no-one is going to disable
> since they'll not have a usable system otherwise, it's not needed.
>
Hi Conor:

Yes, as you said, it is not needed here. I will check it again.

Thanks.
Binbin

> Cheers,
> Conor.
