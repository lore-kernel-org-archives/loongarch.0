Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB2634751E
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935883; cv=pass; b=a3W+P7i8t3mCT9INxPSzj4HR8xNbHIjyI3v7Syxk3ZRxkeurJYkjlwn+Hb9gCtQ73D4RO5zRtBgcA9tk6ixIM8bWcxtYNE37aK8kWwXLQyPT5GWwerJN/gf/2zL9wFb0Lr9LOjORrh1879jxlZLatFIpeUklY3C97xy1/xrd2q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935883; c=relaxed/simple;
	bh=LHtZeQs0Tz+U0h0N9Ycucp24b8vvsudRGqoVRlKP4lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rg2F0CwLEWA5/NDSQpo3eBD4yPlZDcdOTGvmS2RZBJrttgreKw8O/whUDLz9sreqiCIgGSsogqNcIxa7VSvrAjK0HbuAA/TAb6mUGtKcCZMB8gcU+hx++tLQkHvz0ru3PnLow4xOwZhxdxJPjTvjdK7aY3vAK2uWjI46tahee60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIoqh3I7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALlwkYZ9; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIoqh3I7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALlwkYZ9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFVEw3588414
	for <loongarch@lists.linux.dev>; Mon, 8 Jun 2026 16:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=; b=CI
	oqh3I7IcyG/H02/RR9QY59roYBIBZCHhjF20nryzSkdGX9jFL1GYb5ZWrxtoNBNz
	P6gJKZcqLfYkRev1cXr/PJPRFcjxAED0USSsoam8+QonnPfDW1e4ruqcOe6Hw5/W
	7SPF7k0BTM+Hy2ZlbB/sekwRDyNPZCNjZpGEPJNr57AwW8djS4RrpTAQrPEZH0Xm
	NNgJUEvFgqCjNOYiuiJOet+bM7/RrUL+YoMQEi16G0mMaXUsRAtwntl3L1YRjoTh
	k30l132C1F26TWS6ladsXlcxx1wa2x8SEHioDW5H1JYYLQ4Fr0cHgZQg7Xj3nk/q
	Fcyn+p0Jc1Krn1Yq0K6A==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun41rks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 16:24:41 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6603cfb9d71so6885730d50.2
        for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 09:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780935881; cv=none;
        d=google.com; s=arc-20240605;
        b=iHaBfQZjrf+0fTSokrHhQ32NayCXlZTtvS770F6SYXRcAZlTDEp1tuFEHDU9pME68f
         t1rgb7Ia0OHKm5hjQcJOLZdxD5PPpWtyKyI8fyfpkQsSVBiPzeqdVVo3ccM9A6lx3cIz
         sPxAUkOkGDw9KhO+XhDLsH2V0szrJoCyRsDfESMee/aDh8v+f68i/mAEg5UhgP4RITzw
         ap5Jx9tvHGNesW4gwE8M9v4cT5Vb/pNsot4sxdCkGCSehq6Zcoaoa29Aiaz8rVaEbJTu
         4SbWLAf2k5rSiFWCcBH2ODiGhxJQOD8HsnRJMXaxmj8gNWeIL4SVqsdv2L3B2oTDbrCI
         tjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        fh=CuHmbskPcCfFpBYkDM7kGn5lTFsGgOJAvkU3lpOyyfY=;
        b=a20VoDXvARKsjWD2/KlmlVmYvd1T9REfzrJmeVe13ZyVqJb4i2TrK5FHEql/jJ8qv3
         M0vVU4FPy3d6ctVFQrqvs+t9Ofu4N4gv4tkHUnAMnPcaZ27+dd664FNf4myX2HTWTxLI
         ksP75LDIKTOOjazSOx5ZL8eVqAJgMVoBpLWOFFqDlPUvBd0/66Xx3/jlNLSbQu08qTt2
         TTbO19E0XSGwvqpFmz3Qmh6nOsfxnHDxHEl0vykasj1/zB9LFf3HJBm5z0ywjbzjDe9h
         w3l7YR9Zcn/PrJN0Io6hFOXzs8aA25E9w7pZhgfT5PiBA7g4KS15QDFEQ9eEsnYPXLhJ
         GGIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780935881; x=1781540681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        b=ALlwkYZ9LtvDZzs3qF8DxEv+1ScJ7c4ahALlwxxs8qAVA5PVykCR81qL/e5Jjh9LPZ
         f+8ZdPMLHCgcxRf3tVf41WDQnA7frF9FlrRm5Rmk8B3Jm0KTHiBzvwzRnJ9bBfTK1UT0
         txLqwo3EAAqDQwqiN+cWUcFWMN00YgtgZcWtFBE8XGQDjM1/lR54qekFUR4ZVd1qOKCo
         L6xCr1QMsoquoPH5pAaxCJnnaQqcqCOVedK+GYcaE/u0pJGBMOa74rSPaF+y3txQPpoE
         uJWTutm5ZGAIv6W2JFMOcbQpLgq77Qkz3Aol3WrNpqaIJHfJdmpJBxZmnBzGouKaFKVy
         GHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935881; x=1781540681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        b=N+Kys228n1Ipo+Yo6LvX1n/SnCSWl69hB80ofDui5hk1laKnE/d8rxBd9lbL3XEzkN
         cUQ5nljhr2Bd/IRRBNgalcHcQr0EDaHAdG1LEoPFT8QwbblB0b8Bbi7CCVc0ZbuaxnoE
         SvVT4eNLrDxsWh26+wKDf/gp7P1IW4Z+CdJaf9cGdOR2tcK5FN1D5qxhSYPzBumuj3jn
         u+cHwTiFnaa8p/2A1BFm/E7a/ChARNZfROZODF+58VWzyJFfSGGzAGLOKvMbdUuZsBGL
         5tW9S8nltQQuZzSI5Ria0j2/SviQNlje77Pgy8buUzhIdHqT+SK2KNSrQpHeerKK1wq0
         bF7w==
X-Forwarded-Encrypted: i=1; AFNElJ+BqnFGSQShFQ/PxWu4AeXDgOeBLXPASRw4EnYXkDQoUIrcnjJ0rCCoRoTDkPP5lLiSZz/2snp9Dys=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+JYEwAA6+HZR1yRY4vknBMMHS1tX+RBqZa4tgEuHjLgVBOVAQ
	TDhGX6MskMgF1RCBToF9D8/5zGxhJ5QMR/GQXFp7GkTpdbb9w2VbqASpeijQ7VabybSvpfOmi+1
	vReiGrR1yFNYltX6aPpkZaGHUrCqySLlOZOHKCluSHbc5WS/Br5WgXIAIn7IrY0G7Ih7uAo5hww
	H4FMcjVmDawRrpq3T+cXKiLqJdLNMJ7fhAoae0Jw==
X-Gm-Gg: Acq92OFc2ns6X/CDHHWY3ium4IjbIR8e+r2xysynmT0fv/CcK+1MpscAHG1twK3zSkm
	r+Nh9uVLg20JvxIWWg21qPBcRQZbQ0vQ9yAGoqGf0hSv2mNgfXWtA7369KyZ8M3GZ9LmFfaWnVb
	RWSYOjnNgqf0UuX0Xwlgql+KM/Hpxk6rlkwVzzYbq1OSOFhgzdRigpUcxDDpqC1i8aQjfV7lRo5
	NqowDaPNlqEfnT2nQ==
X-Received: by 2002:a53:c5c3:0:b0:65e:48cd:7fd2 with SMTP id 956f58d0204a3-66106f6a47bmr10491403d50.54.1780935880721;
        Mon, 08 Jun 2026 09:24:40 -0700 (PDT)
X-Received: by 2002:a53:c5c3:0:b0:65e:48cd:7fd2 with SMTP id
 956f58d0204a3-66106f6a47bmr10491371d50.54.1780935880148; Mon, 08 Jun 2026
 09:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 21:54:28 +0530
X-Gm-Features: AVVi8Cd5IwkMkDgaeTWHmXts8_fu2m7CAyoGep37i45EZYnSM24rOUfn-o0eV7g
Message-ID: <CAB19ukFFwm3ehzkBFr+oXRjA7VK_4_=XHFSuqdEpbVqUz8Do4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NSBTYWx0ZWRfX3dg6Jk5P7UiI
 2ytWk/vgTdU33F4nOMJ+Q20dO2EPEi1jX1kKYv/XOnGLkS8gbFQNvHUb+9neXx6oRw11Cdcgo0v
 PV2jBFDj/PjfBx5KrgFaCMDnxSdTERvms2TP3kFqBriblCJu6kTWVRjRs6xjstWBs92LK0mNIy9
 yEJW/MUuKltVSl/BlTq2RVE3Ox+qPLmqpisEIf1k1hZ4t7T5xcOpl527JUvA2qXaoYQTgj7rdGT
 pl+jS6rde3Y5f6poV7FcMQOVXXW+cpqVjluHjhSmkpu6mZZIsR4qHDjGiA5PI9F5vv0oKvXU8sX
 XfRrNpmklnpJD1pNlgCkQY4obNg6iPMhfqZb5JG2x7Vll9AY7nJFhopllbdRVl5DEbdGBDACpLP
 2Pg5bTey2wM+PYGuPlt1MNYhyJ5u8jco6OauzxHTExgd9gMacfGNO6Mi7b8lCafZekoaxgs9Euw
 B2riziDAR6XPjhQ0tPA==
X-Proofpoint-ORIG-GUID: nwaV-Fb6NzjCfFPR2bohc6pn_s7A9vQ3
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26ecc9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=66Rqm3UGZClwUuHIDRgA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: nwaV-Fb6NzjCfFPR2bohc6pn_s7A9vQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080155

Hi Lorenzo,

On Wed, Jun 3, 2026 at 1:51=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> In riscv_acpi_add_irq_dep() the main loop condition would currently stop
> the loop if an interrupt descriptor contains an interrupt for which the
> respective GSI handle is NULL, which is not correct because subsequent
> interrupts in the interrupt descriptor might still have a GSI dependency
> that must not be skipped.
>
> Rework riscv_acpi_add_irq_dep() and the riscv_acpi_irq_get_dep() call cha=
in
> to fix it - by not forcing the loop to stop in order to guarantee
> dependency detection for all the interrupt entries in the CRS descriptor.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/riscv/irq.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> index 9b88d0993e88..cd83c3035cf6 100644
> --- a/drivers/acpi/riscv/irq.c
> +++ b/drivers/acpi/riscv/irq.c
> @@ -299,6 +299,7 @@ static acpi_status riscv_acpi_irq_get_parent(struct a=
cpi_resource *ares, void *c
>                         return AE_OK;
>
>                 ctx->handle =3D riscv_acpi_get_gsi_handle(eirq->interrupt=
s[ctx->index]);
> +               ctx->rc =3D 0;
>                 return AE_CTRL_TERMINATE;
>         }
>
> @@ -314,10 +315,8 @@ static int riscv_acpi_irq_get_dep(acpi_handle handle=
, unsigned int index, acpi_h
>
>         acpi_walk_resources(handle, METHOD_NAME__CRS, riscv_acpi_irq_get_=
parent, &ctx);
>         *gsi_handle =3D ctx.handle;
> -       if (*gsi_handle)
> -               return 1;
>
> -       return 0;
> +       return ctx.rc;
>  }
>
>  static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
> @@ -381,8 +380,11 @@ static u32 riscv_acpi_add_irq_dep(acpi_handle handle=
)
>         int i;
>
>         for (i =3D 0;
> -            riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
> +            !riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
>              i++) {
> +               if (!gsi_handle)
> +                       continue;
> +
>                 dep_devices.count =3D 1;
>                 dep_devices.handles =3D kzalloc_objs(*dep_devices.handles=
, 1);
>                 if (!dep_devices.handles) {
>
Do these fixes need the Fixes tag?

Otherwise, LGTM.
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

Thanks!
Sunil
