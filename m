Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F2280CF1
	for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757658182; cv=none; b=q9Yq3B62GqjAFm0a5+Sp8CZmuORKQmbHNRZuIkAbgyIq0QYlTpeD7eA8/vdE6ZfaWSVj+T8UgL+r5VglhP2ZnfcGPR8KKUQqaBZPkXpnprBnRuaSLWNuQNeoOaHDHkMP45XT9R/UsXVNe03yd4OUMpJZ/iMGJSn98vKjC/sAUi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757658182; c=relaxed/simple;
	bh=zWY++i830LvVnaKNwrHxNlZ8d9VBtxLHBranm7dk29s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIl558+Ar4xD+pl59g1KebUkowlI+PIFOMll1Jt1Pn2gAFYg+RPLsY+Kezdtqy3a8z8UK8GrBbKL9mo4S3XuOEcZJ1QhgZol1nfY+KHEvyn0HaIFSxVRxTtp9j/EkjZQwk2+X+0Yvp1NvuzEtWIgdcWAe3utcdmMGpn/I476JQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iglprs8M; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iglprs8M"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso3107753a12.3
        for <loongarch@lists.linux.dev>; Thu, 11 Sep 2025 23:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757658179; x=1758262979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vd3FO0uowfrzzTtnd+6o2GR4OoJtCyfIGsohefrxVg=;
        b=iglprs8M3hEQ3ZqKd2gL9mmXZkxot4WPXxMQxpkQIJi56Nx/nSKzW3+lsNbhs3Xji/
         JlNaA5pKxJ4on8shTuUmA4Ec9EBitWApsXUKHKdpW3DUQyFrv8csZK6uPshpeElh8NfC
         q9vQ5BUrNVhzFt38cMRJHaX4hy5LY9VMF6DOhuUOB2IuC/RtyyfevoXQQR/PocdCyFHz
         M1DbHUV3pLC4wz6pmdnd8QUPjbXwwM1AR/T1jUtZlv56lLU8nvI/zN38f7gpcNHHVTV7
         vwfI+cbv5mFhTBj3cu4Ml+jQLA1s5RbxO4O9uJGpLfxlTWxOE+7tqEAuEheYRXVNEpS/
         ti5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757658179; x=1758262979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vd3FO0uowfrzzTtnd+6o2GR4OoJtCyfIGsohefrxVg=;
        b=sS4XDmTsiIzstO7jsP+qudUEQP6o/axWbBrwwoBbsoUzZrgd2TfoBw9U7P7whbXEY7
         vQ9iivC2SMybJ5PgP8h15tVGr/QWQB660VoZiIRJdVlf98TjePbVUHhZKTe2H8QQ54N/
         CtdiqdbEfDdwmIGeKiXKRo+ggqwtfOBryAkXLukMQI1pOR+g+rKw5fVO1Osa2DPFGh8a
         kgEhpKWV0eX1l+NPTC/UcMM6EVS3k50ifNonBeWZQQfBJYlenSFsoBl4CBKm4BcvJJfP
         f3s/GAxYRoaS+ifJGOsDnGy9O7MWF1CsvkQBSxO17B9mYE8ZBLxt5c18lzP9w+kVD/2f
         4EIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzsKauGo0KBUD0w6Z3/39a4ZYcKjLGVkx1VEsg0mQFJde7r72bmtmYID9pbfRyGDLqcLuboPTdBsU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCbuB5CCxBWpUtpS1eEerAjWzESCq7/PdZBxPHMuXSAeWH/+EK
	G8czTIOJFVeGBTnccqjxiTR//VjQEEGqgeiju/0Cb0lE9cuJaY6EfmqtsK20a94p5ZcgUfH4bQ5
	LH//K8XYzEuBXyORlTYfT66nWy2ZJXjY=
X-Gm-Gg: ASbGnct+sRs40hICQb6ERkW3HlApkrt/4TnPwCI0822QlQ4FpByMKyjnpyZ4oyk474c
	uMUB7EbuwpHSoEW3+dRD2hfV2xdoVMi6YLf8a8lY7/MPiCEkZ43Xfle9M7wZlDaiUkJH/AANomU
	EBMVHG8cB9r/RdoV4s66cUTfHOwqZZzZ2foPfGuTwKMBr2U9qONook/l1LD8T7I9GbM6gj/nrc8
	VTsBlQ=
X-Google-Smtp-Source: AGHT+IGdp3hwfo5Kwg99zLqhk776/MuEzEwF5dvS3N2lEAqhArzZMDnQD2cE/bqWuyKoeqbqUDyopoXkkgYUTvQ3O3k=
X-Received: by 2002:a05:6402:438f:b0:615:a7f4:da26 with SMTP id
 4fb4d7f45d1cf-62ed8240ff2mr1847667a12.12.1757658178563; Thu, 11 Sep 2025
 23:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1757318368.git.zhoubinbin@loongson.cn> <2f93b8f20c6e93a15258888998e926814bfd0adf.1757318368.git.zhoubinbin@loongson.cn>
 <20250910-fast-seahorse-of-valor-bf6c86@kuoka> <CAMpQs4K-6Re=-gELPEg8kP_NKR5_1U=BD6fnXM3wgUF+eMtpGg@mail.gmail.com>
 <58fd8506-678e-409d-8283-1dc44c9aa8e2@kernel.org>
In-Reply-To: <58fd8506-678e-409d-8283-1dc44c9aa8e2@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 12 Sep 2025 14:22:45 +0800
X-Gm-Features: AS18NWAFsm3MIrwnLZoEVJYwuVnBuLzeoBSPe2_MKDz4Fo1FlK2hatZH2ik4P8s
Message-ID: <CAMpQs4LjYPmZh2O5L8V9uKNspjMMq9w3cKCS9iSEStCHVGkg_g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] LoongArch: dts: Add uart new compatible string
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Haowei Zheng <zhenghaowei@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

On Thu, Sep 11, 2025 at 5:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/09/2025 09:55, Binbin Zhou wrote:
> > Hi Krzysztof:
> >
> > Thanks for your reply.
> >
> > On Wed, Sep 10, 2025 at 4:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Tue, Sep 09, 2025 at 08:11:20PM +0800, Binbin Zhou wrote:
> >>> Add loongson,ls2k*-uart compatible string on uarts.
> >>>
> >>> Co-developed-by: Haowei Zheng <zhenghaowei@loongson.cn>
> >>> Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
> >>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>> ---
> >>>  arch/loongarch/boot/dts/loongson-2k0500.dtsi | 2 +-
> >>>  arch/loongarch/boot/dts/loongson-2k1000.dtsi | 2 +-
> >>>  arch/loongarch/boot/dts/loongson-2k2000.dtsi | 2 +-
> >>>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loon=
garch/boot/dts/loongson-2k0500.dtsi
> >>> index 588ebc3bded4..357de4ca7555 100644
> >>> --- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> >>> +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> >>> @@ -380,7 +380,7 @@ tsensor: thermal-sensor@1fe11500 {
> >>>               };
> >>>
> >>>               uart0: serial@1ff40800 {
> >>> -                     compatible =3D "ns16550a";
> >>> +                     compatible =3D "loongson,ls2k0500-uart", "ns165=
50a";
> >>
> >> You clearly never bothered to actually test this against own code.
> >
> > Sorry, perhaps I should have included more detailed descriptions in
> > the binding file.
> >
> > As per Chapter 15 of the Loongson-3A5000 manual[1], the Loongson UART
> > registers and functionality are compatible with the NS16550A. However,
> > generic 16550A drivers cannot support full serial port capabilities,
> > such as hardware flow control.
> >
> > Based on your feedback in the V3 patchset[2], I attempted to use
> > compatible fallbacks to avoid API breakage.
> >
> > These fallbacks match according to the Makefile's compilation
>
> DT bindings and fallbacks in DTS cannot match Makefile. You are mixing
> concepts.
>
> I said, this was not tested. I am 100% sure. Instead of replying with
> irrelevant build related stuff, please come with actual arguments, e.g.
> output (on some pastebin.com) of entire dtbs_check proving no new
> warnings are there.
>
> But even without warnings, I see with my own eyes that DTS is just
> wrong. Or bindings.

Please disregard my previous email. I apologize for wasting your time;
this was indeed my mistake.
I'm attempting to correct the issue by changing the binding file.

>
> Best regards,
> Krzysztof

--
Thanks.
Binbin
