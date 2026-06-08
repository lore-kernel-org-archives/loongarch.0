Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31634FF5D
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936709; cv=pass; b=WoGjya+InIWo3g0J6SxpUYenUBAxGpWhHc9+4vZ4wHkzljSSt6WgkSLOqXIeoiFDtPxfJA3DPtB2LlqYsfTixgewHmVeoFtUB3PtbPLwmWo+TtZvSqwPYZrwdNPjhZ29rt0++FU4qR4wdagc8BIkcMwEZ4aWxvdwmimkVCFLULg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936709; c=relaxed/simple;
	bh=Vm3wQtaCS6UNXPo6wK2kH7vneATSo7Rhq6i2ABg2hBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMBpk6dDLsOIb1Jq0CSygb5mPHxDxFqD2incrEoLogaKWmC72gdIaac676QSWh9XHeO2zm3q9tKeOflNQn69+cyYzefdhgr5MACSH39pYZm71gVNdnOAHUnH9jLFWP+yRYSD2xLTk04/X1bWr8xFQRK4YWX9VK5ulY37leL8O8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLVN1rGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTDMveCS; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLVN1rGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTDMveCS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFWDV3524804
	for <loongarch@lists.linux.dev>; Mon, 8 Jun 2026 16:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=; b=aL
	VN1rGk2GnCSWpr/C5mhI7V/5mo7au+DRCD5bCtE/56VkmF3zZDD5S4QGK7eSdi5N
	UDkPQvz/UwKEQ20ogLUtz1AcvotEMA2huV18YXdRP65okCDNEJ6s1EDD3/5TwpDE
	4uwuNiz1cEICsvSq5yq0VanLSarRqXHJ5Z/nihGen/hbOw+rv0BrlL6ic+AjCYVB
	sC3pDYPM5qOzS5R4T2Oa4Mft44f38yL7Ok/A+AK4478fvwXX47e5FexQBHRoHG9G
	JUvnodwGcFbbiUaiSjH374OIWgz7p5hfDSJLtjjr8OF4szDFHS7ga8B9VfPqNUN+
	Cbh3tK++gPAtQHfjYzqg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkt4ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 16:38:27 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7e90f879daaso81448977b3.3
        for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 09:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936707; cv=none;
        d=google.com; s=arc-20240605;
        b=F0YPZYTqgNOyzMuMDQ4EBTHgs1aHF8x7nR9+USot8j0HGi5QgLhq96dfmV2dn2idFP
         itltjcDoGws1Cs91Kp9RILMLZ8UrxfKIq5l28uWU9PAbcyCIz2tmxJq/fvsd/vj+L7SL
         gjNjXIGKEfWhWAGLgn9M/n0+W1nP5RzPK3DI82Jzyi6VXL6o5qHlE/SF1O06YhYyHErH
         eERT7VMkbdC9RWzOYmu+EiX8CzmYe+EB0ju2eSPX3dT/PLGYOcY7KuvWQklRjc5dmMoV
         IN4P2VnO7WvJOSBBTxD9nWXcrmmDXR3q2HndbXIMfY+pWVhhY1uAy1cDlrBv9WNUuQ8a
         c/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        fh=ixJYL2y3XSQAb4NPm6Squl/mujHSjPqimbyX8uIoosA=;
        b=WGSyMf5q6Iv7ZWoEMmjMSTCFxt9X8XnNYP+XCmQIMwDz2fX5m5F3YrOMnh2qCsDf6p
         Tz0XtxzPYloPywix6Pnas+ka4Ka75ZZ7NlORlCVUI3q0ak4b+2VyhlPAlW2qScDfuY2a
         HQel4Y7uyPCb2Hupi7JTac3lVSgDWx58+ylr0Zdt8Qg6WetFrVXRcpH5IOSzSfTvgtkl
         8xfP2H7Mn/Zt33pgnouxX01hr7/kYOdPFwQ4Zd+sMrvv1W7vc5sJGdi2aitE5x2DEri7
         P2Yu7+/21h+D0PA/F77CzcaHl8pl1a8JOIte7DlFTSfD0qihM84eTqIb/d9RAon2owB6
         x/HQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936707; x=1781541507; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        b=VTDMveCS6xrg5jwVJB4WOjtetkx/me9TlmRCuwQV2a6GyhPHMMcxAMVqEsXQoUKjjF
         XdRgo5msHnM3DcM5HHwkCw+URXtlzBn2W69B5JXy3zkLCos2ofIKA7bBQUKJqzM+gC7j
         tikufXehWfF8E/6j3QvmOel4yNYFJc1V/ScB4ac+ZhrCW8UdknETQNTzcjWWOi3aFFKy
         JE6SIuN6JeLTWNZwboWxziQdB9+1Esc2mSdThObk3y9/7VyG7KvJ2zo3cN5VG8nwiO/n
         /8+HhpHYOoluug2/HiBNqWk3ahNLiCMN1UoiQGMr7Jy1mfy20WARshExGMBkphFfEJut
         zR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936707; x=1781541507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        b=HX6Z4BjMhygbKf8yL8+vuHzLRnV24iUt4GJE3v+Gg3XyHmZMjyfC5WwJ15NBI2jLEu
         YbJMwJd5q6QrCKJOFfJfayb8oTtlpVQlQdfSA+RBoU0ilb0+H3ks48XVMTvrxWBDekAA
         Tx32iPXY+lPir0wok7r3HE5fHexvffXv8a6XvkQgWvkKUNrBm6AqlPmgFsHkHxodnNvR
         qCwS4y+CogXxye//NfS5M0WXQN0gi+KhUdYWjnRbpNDvH7nUXd2Vp0zMc1AJYhvwx+z9
         LYar/wn/QaziUjGc3gaR11QcWNQaLGmAWIOv4d3XLrqNoKoKEuy8UVN41L5/q8+HJMSv
         YMIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ARGnpaDDkDOL8feJ4ulKX5vQXb35BZEK6mpGSpdcxhA1oVk1td/hwtVOQtDE9jJgCmrLB4yNef6A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwR0eQQp2w31ns1Xk+gOpx8H395va2mpIA5k35dZGhPaZyzWhhV
	dcpjCoPHfLtLPEJhEkVZ0cmI2ojdCCz4g8Q6aODbMxlGk4tUgeWzlDKc78lhzPUX2Vy5O6oRCOi
	e/kHSXZJm1V6aZnIVd70YVMEMvUrC1SoaYC5k3UFlCo7iAnwxXwDWSztBZ6umdk6qYyoHAgSTA0
	11Z8kKHTsT6103qeiFH/IyZ184gDWDCo5RBXNnFQ==
X-Gm-Gg: Acq92OGRTjPr+tLZe8a7s9wVqlIs9IAygRptlwk7xWm71CNRW6h5+l1x8sQ9fMgpZDV
	AdurKXhE9WTh0x6YeWBv59dI4bguWFOZcG+UK0ks0II55nj3i9bvmeQoAwmxwY0RghGMlpkVqEZ
	QtO5P7MNGiq68y9rDR2YO6/fCjxU80ZZbZ7sUJCNE2NGD6YjVkdego65NLhJNjjU22/iFLOR2Kq
	CBvbbqYzk7rW8QIag==
X-Received: by 2002:a05:690c:e3d1:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7ed0d3cbcc4mr155717427b3.6.1780936706572;
        Mon, 08 Jun 2026 09:38:26 -0700 (PDT)
X-Received: by 2002:a05:690c:e3d1:b0:79a:60f6:c5ed with SMTP id
 00721157ae682-7ed0d3cbcc4mr155716897b3.6.1780936706088; Mon, 08 Jun 2026
 09:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-4-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-4-23ffa16b6ebb@kernel.org>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:08:15 +0530
X-Gm-Features: AVVi8CdP_PRc1DJjUVOc0gMS_HHZf1oDGc6wp_gUILbiw5JbF5QWPmOsllQtoVM
Message-ID: <CAB19ukH5hx_kfpfcRiuPFrUmvFxMk3B08RNjcaxx3C6fDBS0dw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ACPI: irq: Move RISC-V interrupt controllers
 autodep to ACPI IRQ code
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
X-Proofpoint-ORIG-GUID: USElx4482-OLgbOqG4de8bWnClf4zGb3
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26f003 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=bDdBU3oEAAAA:8
 a=EUspDBNiAAAA:8 a=bDd8DhsF2Ke-o0a1jUUA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=qeNa2pbTr82C0GpJEZFS:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: USElx4482-OLgbOqG4de8bWnClf4zGb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1OSBTYWx0ZWRfX8OE51WxwANvL
 IP5//k7nLAGjtWmeWdfT8hvAqXhtgnwb1vwn91PIS/WJbPdAiM5iD+fDXdhMI6v6TuTi6RCCq74
 Hv8z8rdO3iw1XhycYSkBjr1XO5V5q7j1oRbDO+o/5ecKkyNmRy4IoPuD2I0J8LQzEvpgcMSH52k
 yYjNUhviba7dQuDk3U0FsR2LZwDnBs+kqkITOjUOnQyl2u61vvEC1yc/rAVqIbvu22OrT60l7UW
 Rm2F58IAXYLBbZXvFFztgkYBwu+Vye/tZyswn7uG8Opl8Dtk+72B/QCin/WBG2J15gbj2633UmC
 gsi32IbY7GfF6005oB8SxQxKaSlaNbYjpRwlqTBaauOtRvbgEtdictoliRSvKiGSP3HoSUb398v
 4vOi8ymPWKGIO6PmTqWlM7p+k4On6HaYz7e0lrlg/xXaiB1ETtmIHkNQCHYvNi8bQNBS+5D/ick
 HKsJxRNi5lN15rrqVxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080159

On Wed, Jun 3, 2026 at 1:54=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> RISC-V implements arch code to detect probe dependencies for devices and
> the interrupt controller the devices GSIs are routed to.
>
> The code itself is arch agnostic apart from an arch specific helper
> function required to retrieve the acpi_handle of the interrupt controller
> that manages the device GSI interrupt.
>
> In order to enable IRQ probe dependencies detection on other architecture=
s,
> move RISC-V IRQ probe dependency detection code to generic ACPI IRQ code.
>
> Allow interrupt controller drivers to register an arch specific function =
to
> determine the acpi_handle for a specific GSI number to use the mechanism =
if
> needed by the respective interrupt controller drivers.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  arch/riscv/include/asm/acpi.h       |   1 +
>  drivers/acpi/irq.c                  | 172 ++++++++++++++++++++++++++++++=
+++++-
>  drivers/acpi/riscv/irq.c            | 156 +-----------------------------=
--
>  drivers/irqchip/irq-gic-v3.c        |   2 +-
>  drivers/irqchip/irq-gic-v5.c        |   2 +-
>  drivers/irqchip/irq-gic.c           |   2 +-
>  drivers/irqchip/irq-loongarch-cpu.c |   2 +-
>  drivers/irqchip/irq-riscv-intc.c    |   3 +-
>  include/linux/acpi.h                |   5 +-
>  9 files changed, 181 insertions(+), 164 deletions(-)
>
LGTM.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
