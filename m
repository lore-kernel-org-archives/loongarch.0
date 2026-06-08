Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4833A31F99E
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936248; cv=pass; b=l8xB0v4VpRj2Ipwnrhg1Tu82gLod/WPfDDwbzZWk8Qp3jfBFa8WmHtvw3Jl5dXDP6Y63cGh4ADqp8T3suk7nzgtRlyzgfdpZO5kGo38NtomsdvndImlA4814a2QJsuFIR47j6xKeN9D90V4KGC79lRuhMbhA92HXEd0fh9xnz4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936248; c=relaxed/simple;
	bh=iVjGZf74sddO0VwaK0/NVSR5ujcgEOoJofNUxGTnP8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Js97HH9I3EwgTp3zoKNYxmDhz68KA3OuwmlwKqob/5T+Jr5L6rslGIizDoN3tC+y0JJjPdvClfJcHRzeO8jvzmKhI1rR2VuehU+BdBdRdyvOVhPOyyVhPNSjOwh8v4UJEgpLngApf05ayWiYebgV3wmKYeNOoSRrfgIJty6yaW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcShYuEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea8OBQAK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcShYuEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea8OBQAK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFT6q4008507
	for <loongarch@lists.linux.dev>; Mon, 8 Jun 2026 16:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=; b=Jc
	ShYuEjajO11QNx+P9XS8wV9QDiTTs4AcyuiWhZop6oA4R9vpZ/xuIk3VJ2UdMP+Q
	VlhjAXtHNd9pPr5psE0IzXfZYONSAiBszhF0CHHLiAssX93R/s/ov0pnNY+VxI9h
	cc/uAg63M5E/lbbbFSOLxpdvIjy9piS03SS9/QsQwhQ/chI/zRMAhd96k1KBqYYT
	DZIaBhu3e62xqVfo3MbNxxoS998MXMxlsuzkyWTTA2y2AltD+UyHqwqUYVFSbsQ/
	DU9NJKE+MdXMxcp0OsN+/eA3ASnZpuLWKbWz0gt/sUDQpCZpJ2e29vUlhcBDcq3r
	jno72HC2CrKW3VjfocPQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0j3a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 16:30:45 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-660d7828f42so9356221d50.0
        for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 09:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936245; cv=none;
        d=google.com; s=arc-20240605;
        b=IB8lFAEjtGrlvbCH8mn32Lvi+iSJKt1J0aiBctOp/hzA0we51L9SjOXfILtPZtSGUC
         k5IdYeSgFOu5+4LHZShf3x8zmIbeKrS+ePFeIh3RFZTVoQZFS7v1eFvd7w6VQ2JoTD97
         zZwhDdjPyhcF/bWLxPYzm5GULV4MI2so2kLdoOrV1/wuWODtHY8kkzEMZahy4WLWCr8y
         kIUgDMjM+PxH/aUC8U9sj6KicxIaZCPqxX5wfQCIrio26opIh0RHDryg0SL4J+WpORT9
         ChmHdSREK5nLKL0j2pIOxtFm1cxdKlDx09Q12ePbsiHvw3T/41nLqAj1yRyyaOgArtl+
         Zgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        fh=dy+9MitxzNPDSACV9lVM/vV6AYbbrCEb5A3QfMobWzM=;
        b=igiwVOzVzxg31sBIoYF18tTyUGl8UIoW21ebCFtJY9/RDyUMyXMGO8D/vIUaK3nWkh
         qU5+Natt2oltcINaD1M/qqrt8Wa6oj0hkoMR+rr3Hug5snK2Gi3jWSpKAcgVibrzNs+C
         Xsf1Ee9PSx58a5ExFaRL7TXFfp3SSLEcZtJ7r8GxXR2OpSS8GBl5J6remWohpWZ9cR+D
         eHIyOgMQWQm0t1RMeUB51NZJQY65qZoM0AkyvBr44BnqUwW+Clkln1W3eBM4c51EbnyA
         gVnepMbT/ZDXM+Uc6iZ+XRn+t9u83dllGkJ3GOPCISKu6CvDrGUtCSbpD2O4lBa0bVg2
         7Qag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936245; x=1781541045; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        b=Ea8OBQAKcxOqhD+CtbQbOuCG8kJJlx99qaRLaKwzrivrzEOU20CUlF54Y8ETWN8QYq
         MqJItyol8qxNJqsHUJ4B02uqawl9T0/nWFCezYBT2NUOVox8DjPSL3NRXD+0aMCUvX5a
         qWkZ4EPhtgGeN6kGVqaXB2Dcsn4W2N3uV3E/3jYVlZCL03zjsDHNfWOOieODytF5ykD1
         6cXuC+1FTWMVeYBpYnCOHhJ2NntW5LKIDNcQXaLTc1hGmRnu7bcZ1Abq/MbUGAvvnBDi
         UZy74sA+7ZbhezDdUCD/R/8QGvSo0H+zUinqQX/bLWmEq+8W9fIrW9kaPxG48L8yhUH9
         RkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936245; x=1781541045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        b=b0i1wywyVqjtnhcCMgvbzES0020bcgQi5sApuPS3f/QaV+rjdnv/gQ1hxkheraXDjt
         /Ofpjz2ghHlHS9pWjUWUQW8pNcSNBjGgmBmznYgXFyFmJiLNEJSBGcxM0czScVo7+Rhg
         5d1/xvKRy1OM0XiGPKGQQLX27V9LoHDhpozm+S+3ZJG/ngvgHpoCgK/gE0mDLWGKC1ZH
         VS8gLgiXLHNRYpHLAcg222z4eOeFRphK0qcmzsff6c6qqlTyCBFQ0SCYjMP8UsT71BYp
         UnkD934kCBq9JYBm0mDGITewUedZX+d7orgQVtvib49QxjDSv4SNUqTgYBpVkaXx2qN5
         60Gw==
X-Forwarded-Encrypted: i=1; AFNElJ9uoJIVrHP5mjKuIgty/1ISo/KIJZZ/xW++Izlud0lYaEXvrgB0yKuopqBDbZeKPVkALrdwUeT6YV8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGH8qTHsvcUckd4xytnAJBXik1TyMrqGwDNFRM3cNBxZBluEHd
	e+wMRxGkxxK9KNCxKUB5MS6GHHJl0QaFvxssMnonaqnNcULVyr1ZSjwfYqavVWiFA8u9Uct3rjL
	TCjA+UMvmNKapXrGboJzbhk75/r58SA6gU1YKKsIlAwR/uJidbVGG7Be5FHBZ8nVJ6fd9VHfbci
	mu0rA0XUiq5JWRdU8SI4WlEIdc3ThN7lUacpF5yA==
X-Gm-Gg: Acq92OGR2MIpTNsa7bXtwao1FIDbZpYrlscDIdRT/GFg5pV8iV4yXSbFjuCcE2tCshn
	90haIVlNYXilqB6PdsUWJFxeQ9eimokbcr9OOpMrB3aZFO36JukWfHiKbacbCaP7ELzpJnS+6Ix
	KWss6FZffmGZWohYv2JN6a/nBO4rUwMM4ybKG8SxY6lhv2Xs9P/2LpbOOvOoX12CYB4cM+3YbGH
	rA5oxhirCO4S27R0g==
X-Received: by 2002:a05:690e:138d:b0:660:529f:76c2 with SMTP id 956f58d0204a3-6610a62ba9dmr11112987d50.8.1780936244688;
        Mon, 08 Jun 2026 09:30:44 -0700 (PDT)
X-Received: by 2002:a05:690e:138d:b0:660:529f:76c2 with SMTP id
 956f58d0204a3-6610a62ba9dmr11112955d50.8.1780936244186; Mon, 08 Jun 2026
 09:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-3-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-3-23ffa16b6ebb@kernel.org>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:00:32 +0530
X-Gm-Features: AVVi8CcjdmtpKU9pycNL-hwxjKIaJHrcR5nC3cRzrIaKxh71BhOXsVMQNx-uaR8
Message-ID: <CAB19ukFw34et9YULib7i-xXPirrW-TVK96PH3KKR0Nb0iiwjNw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ACPI: RISC-V: Fix riscv_acpi_add_prt_dep() loop handling
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NyBTYWx0ZWRfX/I3INZLl34pB
 LOwts2sKnBD7Y0dzF7fXGWs5FSMQFl5GTgQ5/o6Jp9WKuWz8Y7r+RdltDAx4IP7hxGd1BMMJ/2b
 6Tcxt1e7lGY2FSpioaaaYmdmRalFMtq/KNnaykGw6B1uM0jUajG4APSPoOPZkIz49dkjubK/lIi
 IJjxRzcO6JxO3f5r/qvNp9w+UPQiU10i5NySLKfJ1p0Yp4L6+JkvplI1z70ua5Gcr13di7FJnG/
 XC/QQ7FRmN75Fi58yu5PFEF6kh7MS0MD8/YiqlPyBL13JAkLbi7IzxwHo7deFZlxycalQIlFzeo
 BWocf0tWSEWNJ+Oulbl9aobxEjFVKCpjgQH891m4QcTs6F4S7Aph3st9ZxB9FV8mxUGNZNzePTh
 pgNRk7mJaAETob9HKhs5R8DllCOr0omGOMUtTMGYPH2g5eqJeylwVZvvgt3Ujnh+e7HWe1NAkE/
 s2+kyMc+QHNaEOAFFig==
X-Proofpoint-ORIG-GUID: bkMBQPxeXErXMU0rH9_zjOCpXWV2r6YZ
X-Proofpoint-GUID: bkMBQPxeXErXMU0rH9_zjOCpXWV2r6YZ
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26ee35 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=_MyEUG9zEuNOLPre8u8A:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080157

On Wed, Jun 3, 2026 at 2:18=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> The loop in riscv_acpi_add_prt_dep() includes error conditions that are
> handled in a dubious - if not outright wrong - way, by continuining the
> loop (which skips and misses the entry pointer update to point to the nex=
t
> entry).
>
> Rewrite the loop as a for loop (that handles the continuation correctly)
> and wrap the condition and update statements using helper functions to ma=
ke
> it cleaner.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/riscv/irq.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> index 75170151c614..0cdec5dd575e 100644
> --- a/drivers/acpi/riscv/irq.c
> +++ b/drivers/acpi/riscv/irq.c
> @@ -319,6 +319,20 @@ static int riscv_acpi_irq_get_dep(acpi_handle handle=
, unsigned int index, acpi_h
>         return ctx.rc;
>  }
>
> +static bool acpi_prt_entry_valid(void *prt_entry)
> +{
> +       struct acpi_pci_routing_table *entry =3D prt_entry;
> +
> +       return entry && entry->length > 0;
> +}
> +
> +static void *acpi_prt_next_entry(void *prt_entry)
> +{
> +       struct acpi_pci_routing_table *entry =3D prt_entry;
> +
> +       return prt_entry + entry->length;
> +}
> +
>  static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
>  {
>         struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
> @@ -337,7 +351,7 @@ static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
>         }
>
>         entry =3D buffer.pointer;
> -       while (entry && (entry->length > 0)) {
> +       for (; acpi_prt_entry_valid(entry); entry =3D acpi_prt_next_entry=
(entry)) {
>                 if (entry->source[0]) {
>                         status =3D acpi_get_handle(handle, entry->source,=
 &link_handle);
>                         if (ACPI_FAILURE(status))
> @@ -365,9 +379,6 @@ static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
>                         dep_devices.handles[0] =3D gsi_handle;
>                         count +=3D acpi_scan_add_dep(handle, &dep_devices=
);
>                 }
> -
> -               entry =3D (struct acpi_pci_routing_table *)
> -                       ((unsigned long)entry + entry->length);
>         }
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
