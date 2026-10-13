Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525AA3B4EBD
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 01:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791854424; cv=pass; b=Vy+fDuLozsWZLhzLoTAcajhjtaBmGndTi3FGKSKb+B2RA7++Q8KiNorwSrKh6Q15O12rdi6BslAL1o6J2416RXY9NX7pb6oWnp9G+HUNCcSpRoCGK+Dh7XQF59ZFmd/UbOKqXrPlxhHD0aFuFLVlNWid+UHjYKlrvyjriLtsXU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791854424; c=relaxed/simple;
	bh=GLdPP9wdTOmg3Lh8rLtRDBnHGBuo68uFmOzknvlhkJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRLK5aNIpIyc+2MxBNA3FbBEWdT77pyjMCfQEJVFKyV4b1hegQe18LIMWi3exqD5aymfgxshWzEflGxzSTmV7h9R6R0SP5mh6I5NA5XBtCxAz2Ax/1m2xFCd0irVv8CYeHWcA+JPujwWVm+Fbvys6Z6q1FbIC8lEtRpxSJnNBWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUszKUUE; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUszKUUE"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so387995366b.1
        for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 18:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791854420; cv=none;
        d=google.com; s=arc-20260327;
        b=LmF67KUUuvz7hnWYgkcH0kWusUq0/XN5Xj6OairoxVPH2V6fWkPJGJ1b7YIH+ueEve
         wOX3XEphH2deJhS5neDyWtGhzqo6cWbp4WsN9+iZk+6yooIKhOQVwx6av2N/PRJaQkNW
         1AHv0uBs63JPl7+SnBWXo6KU3d+91tRGKS/YQ+DdrrUp2CCF3FMf3aAdym6JJXdnzRk9
         HneGWJRqAWk4JqGa3T7Jp2ThKE0hF7RCYT1I/BaoklczQGJgiwnjg+71xIQHJImFO8Ye
         cdIViTp+fqtO9Cabw5qQcIXpkO3PoQ4AIslPeUAU++pMHe9B2AZpoAdB9/SplOs5dV4x
         zibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eDiCNa90nkNCt2ySXS6KYJDJLT9XVCk1KGiWa9GtHAM=;
        fh=6/e6RWlK55jqEnpXbsIWghQuyff2kbPOz5bohUn5pdU=;
        b=Eu70efJfBIBla5RmgXqcO/7F4V9cd+Go7Z0or438gGZG87GqKIeTn8ffeA5KJIVzNS
         c8jTZb9i8Ssd/cdAmiz7VmUhEUROeDX8fUn7KyQ9zZrLQ/w5zhMaZJzfVmAyE3mcgNK0
         epNicyf9z1zRrEhwjMw6bpA5lKLA4U33gWqDlnuKrmA8M3WWtPjDQoYRfe7RwUxb1jgM
         QZXTgXdhzIGQY6HpLiQYiCbBrNEm6FZ3b+I6KUjGcRGL5aZ7EmVx7QiDqjLXQek8+MUv
         txqJtd0O1zEqBQDBJUkq+NFQQi5xuFTjvIO1h1eRJa5AR7GuICcSm8XeaszhVj9AJ0ZC
         1Sag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791854420; x=1792459220; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDiCNa90nkNCt2ySXS6KYJDJLT9XVCk1KGiWa9GtHAM=;
        b=DUszKUUE/jtn+MkiaRrv3PVv95CM+APIYloDuzUqqpDAQdrws0ybax+Wm8IHNBvdTw
         0QiMq99nAcTX+3JL4wdzfku+4cagtbvX3hDncKtkerA0d/JfeYCEeyRNYjpVO8zE0kYz
         jjf3rS2/AZTey6VBWAcVCV+k05QVTI9fG9gd3oyXxpIIk1iH4muUhL5umP8RMU0cgbaj
         poPclFI9lL7VbEXTdUDDa8YuaN1B4AsmH5We+mznSBpKvxshFB9EIYKfD0ClkRf9t0Pw
         Qhicgld+LVmj1bluP6V+Wd71MySU8MeGPCM84dDNXOg1RxGQNF0uAYUWjgReRwfl2GcM
         85bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791854420; x=1792459220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDiCNa90nkNCt2ySXS6KYJDJLT9XVCk1KGiWa9GtHAM=;
        b=rKGgc/YkZvKYVTmgNIhja4Lefj5nY+yvaqsitXmCN+wK1I/0w1kDxp0Id2+hWtLCzw
         IribPUZeVGjel5n3J91ZW/f+fE+vLEKM8iNx3O0q17EbKIQMCuI3ke4c1JOOgjH42YRU
         NnLXCzIdVvyq+XNtlTZjxd8891E+ghxWabGI8jRA6BWVNAus98UiECnGJB00T1rEYyM7
         toL7VSSqNYRK4eZmzYrbSJF1QLeOhxghXgsZ7puliX6cv8rldsUTGJVxKhlRz2sKM4tH
         trepq+PYa3DLTO1/xP9q6FZpb1LvL/AtdpygOfwSWczu4fdODubdvg2FGjezQYRrYd0Q
         JEZw==
X-Forwarded-Encrypted: i=1; AKwUvBxeYIuzEDY0E8Aacy0wKul6qfpJzqcihUPd6hKogkWhpTk88xPt8afZgF/DiiCtZxe0dC4jgnUAOm8=@lists.linux.dev
X-Gm-Message-State: AFq9FYL/Gp2im7DGjYCohlSI7o3UqtAW/ONqK+zTnn6WNgcTYRt5hdeJ
	LT0EHSpBYnfOIho0ZkrksHtXzda9XGslEFlkazLi1rGG88g0mldvRP51oYDcwq3py5l0YZfyMB/
	FY6eRLNn8nZ9pohVpm3sUOz1o3aa69g0=
X-Gm-Gg: AYBFou26817BSbTFPJR8ODgRzQUdUu1kaqmADaJsNTlv1tApmO+iYxBOLaStxSgW0JG
	kJ/Nf9xU1+3ItGZzoeIIIfBjUHEn6d5ts1uIA3hwHZtvV0tIbG9yLrQC4BqsPzAXZn2b6YlOyBr
	ZkoIDQZckpUZ4qUkMGuiTVZCe4S6UJ2UKCHgWg2gEysQqc+mo4NzZIlKVmMKo9R5WYJZJPNwbsF
	aeUJ4X0WzDFFLiRfVpu4LN3SIY1aBlFrSPCsrPucLmNyWkEpi3WbAzmPFp+q4/6L5OmDyQU4+GN
	mRRPXdr+/WKf5QCeExnsNwaIaglPD/XOWnOInZ620IS5Hd6AhYL1JBU=
X-Received: by 2002:a17:907:9816:b0:c2e:378c:8ceb with SMTP id
 a640c23a62f3a-c31a9fa39abmr1029769166b.36.1791854420304; Mon, 12 Oct 2026
 18:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1791512067.git.zhoubinbin@loongson.cn> <38f8e7cde8e454e7c6b72cb1b9a1c54e67c8a7fa.1791512067.git.zhoubinbin@loongson.cn>
 <66a8df16-01c5-4653-9fb5-7d746f03f782@oss.qualcomm.com>
In-Reply-To: <66a8df16-01c5-4653-9fb5-7d746f03f782@oss.qualcomm.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 13 Oct 2026 09:20:08 +0800
X-Gm-Features: AclHuK83THTSYAs-3kkd9FBwRhF3injKe2tsHVZYn3kSJvncbd8B50m-i70KpDA
Message-ID: <CAMpQs4KiGsC0=xwM+4M0GMWy9XEc60sTpPACK1s97p_JURUr-Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] thermal/drivers/loongson2: Fix negative
 temperature conversion in set_trips
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel:

On Tue, Oct 13, 2026 at 5:57=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 10/9/26 04:57, Binbin Zhou wrote:
> > The `MILLI` is defined as an unsigned long constant. When the
> > temperatures passed to loongson2_thermal_set_trips() are negative, the
> > expression `low / MILLI` triggers implicit conversion of the signed
> > operand to unsigned long, and the division is then carried out in
> > unsigned arithmetic.
> >
> > For example, with a low trip of -40000 (milli-degree Celsius):
> >
> >      -40000 / 1000UL =3D 18446744073709511   /* unsigned long */
> >
> > After truncation to the 32-bit register field this becomes
> > 1271310379, instead of the expected 60 (i.e. -40 + HECTO). Writing such
> > bogus value into the trip register leaves most of the upper bits set,
> > which may hit status/trigger bits and cause spurious thermal interrupts=
.
> >
> > Fix this by explicitly casting MILLI to int so that the division is
> > performed in signed arithmetic.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal managemen=
t support")
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >   drivers/thermal/loongson2_thermal.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loon=
gson2_thermal.c
> > index 4d40fc706a53..f5ff0cac1442 100644
> > --- a/drivers/thermal/loongson2_thermal.c
> > +++ b/drivers/thermal/loongson2_thermal.c
> > @@ -108,7 +108,7 @@ static int loongson2_thermal_set_trips(struct therm=
al_zone_device *tz, int low,
> >   {
> >       struct loongson2_thermal_data *data =3D thermal_zone_device_priv(=
tz);
> >
> > -     return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
> > +     return loongson2_thermal_set(data, low / (int)MILLI, high / (int)=
MILLI, true);
>
> What about using MILLIDEGREE_PER_DEGREE ?

Yes, that's more suitable. I've been looking for the right macro for a
while now.
>
> >   }
> >
> >   static const struct thermal_zone_device_ops loongson2_2k1000_of_therm=
al_ops =3D {
>

--=20
Thanks.
Binbin
