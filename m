Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56E349CD2
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016365; cv=pass; b=e1d47RWaMzTPqy/T5YTgmeFUtsY546KOPQuARXZc3R33MVx1HXIaaIwMuzPSoJ6UpKWtkyalGSNec+FDyev5ahxfPf/MCA6jSxKEGx7KAQXBtklnmNhb7gsrVKRMzVbbG3KwPvT1fjMZYTxybO1qERAy1cUkVf+WLXMxnsuLElY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016365; c=relaxed/simple;
	bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keHwW9QETZfewPgN0pPI1jDUwuTVIUQ4TRq3sThNb1Rl+X9XO2KbSrRx6U8JIUJ1gY+TNbZ/x7G1i6S3u7/oWeLNZeNpALmmFycT1diDkPPD2Ndxpb3jhfkgqYF2mmjYL69Ij45jmQbPULYBVeZaiVnpSBitpCUVY66qL/kyf94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUqcfUNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aw/UivoW; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUqcfUNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aw/UivoW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClV2X2286852
	for <loongarch@lists.linux.dev>; Tue, 9 Jun 2026 14:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=; b=YU
	qcfUNUaOVUkovl/5AssMnAttWPY7SDezAdkO+w640KWrdDbDpxlMFLt8DDCQtOjc
	+GKx50SzLMy8zXgyM7r6SadFmanGTCCh7Y6CNvOHlCuk5QzVyVhgliKcnHKdVXmD
	LHJOQTbG1Jl9u1IVSLFyut3VMqBblidslvPIklCQxjOKdvhp+hQKHcPB1D48e31v
	xP0VHjZ6VJo8RfJSRmq929I3fyQ45t0Xb3iClFnOMwR0OPWnJ4pZGWf1y+awNqtD
	LPFHaxwjMu5LiQ2a/EO+zXdnCzNmY2kzen8bQG/C0g/roSiKTi0NDEoSqxzcFxPM
	AGOBDDAAltAUPagEOjNQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jsjkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Tue, 09 Jun 2026 14:46:03 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e9234db3bfso98759347b3.2
        for <loongarch@lists.linux.dev>; Tue, 09 Jun 2026 07:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781016363; cv=none;
        d=google.com; s=arc-20240605;
        b=QRQoEEtBOD3OhOs/9olhB2YDTT5U/nr6iUbym/GrbqdoyE6T7j5CODdMSxxstQJzSV
         TvuzlS1yicvf1pj3AnRjVolY/ppRJTeecoDMxgr4TRP1AvfK+DWP0hBZZ1YY49KAIHnE
         SxKa8ssx4zQ8ujGdII8SNgJ/xJiUjurFN30I/TOc2+LR3lLsGF5J50atOrbTmBdC4KAU
         jjHxv9QkvQh0F6suVPKgiqFdzc7YXv0X7DRkcowuqQaCcNQMX/kaWQU0/coW+7fGDtx4
         Y9y5hvfOkXzxQqf4lOp3Ow/m/Je9eUi2BDGsRheMTg/Sl1OVbN2qxGQtKjb0iQEydqMu
         6KeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        fh=LpfqwWTAw1WbuY/zgnIUqOo7o+dxIQwjx9w2WwVSTRo=;
        b=RxFKFt9DNTXrI7DCcgX2X9Caxay9IVxm88jVIa2ntY7yHi2EdoYKKByjPZxZsYm2cv
         Q79xwYEhAlokWUR0CDuCnXJ4LsW1rHn7t3r1E7P1VUjndlZBqJoMX3H7aLKVVSF1KLgq
         0OKDzmVqq7kktxvTwA6COooxF7JCYhfHB78HJk+IcocwOALVJpegjRiPokEvGfKgm7BM
         tcvhts9lmXYO4VX6firMgoHLdz1SDT98lH/hMT4KwGWim0pQH6ooqWNGn7PKeU86wbre
         DLixbc38REVecJYz/EoblgTaufhmP4BUgkhqgEPLOQymFVX0Cmwd19xY2ggy9KyAdY6n
         ZMRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016363; x=1781621163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        b=aw/UivoW60HkLFO2TGFCK+g0z5cQw1dt3GyiHroELReMwU9Gwa8QMlqnONJseaSeUn
         47kVSeuYtkoIBnNgilzXFvsZ+zQmYUu1Om65n3pzpV+Vo3DMoBW5NCtC5+NMyLljw4WA
         hXAUrQbO1PLRhaVuzo3ZTF7jXralBBb3PzGctjiOmrWJugJw5B19t7o1hB8Z/xjuGMOk
         TQKuNFbK9YYzMWT397aV/KK4NeJc4iTJs9FnGRVLbwx4ht/IEsU29DXeoJxXP9/l8Ts4
         CwziS3Y9lkHGlWHHT5w3HpZZXpU8+jCn7PBHCK1z+R3kU3vT81pONm2prVJQASgWfUtG
         FEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016363; x=1781621163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        b=BgmdSF9XD19jLzlgDxyw9LUxNxgxkFyxacFUZgyGlGa/SJQxXLzwLyARdK62xuaU4r
         I3tG10gtnKzUhxfSY3wovZnJc75dXk4xx4uHnxywDFunPb6Fr6NokSQcKXyA769H/VMK
         9d1YUlhmVxsJNXJcd+jL1cg1MrcWnnr01VPMohCJO3PqTpWOf2UTKjsr2LKEAvX8iZcF
         CCyoCjeKEjVkZzUKJO/skDZQrtx3MGMX37fBTZFV1JhPT425zTJERrk5l8HLboiz1S7A
         i2EM6kPUhuAjUAnPCGxFoNYqU+Z+o0sDi1jO3dWKboEkHcir9Ab05wk39wR9aKNPiS2b
         L2pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ctI08F2xDcXotpXbixjJKvjbM31I13ZhKgOFyrq8nOrslTacPT1t1jr4ndTrRlbM61V7LsrR1fAI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyB0Rh9kSP8CyYHW9VV5TdEgvbqXN3LqjeVu4GWl2BEUy+GJvSN
	QbWt35xzvNkY8J8W30DEBiRgv1JO56t2U03syDwMrJu9AeqmlEfbD8gfDJeU3G0cUJ4NRIO2CT9
	tI5QMQtDiZUWNzikZYoaSYQHrEvER5nvd1KtpmTplrvAFiKcagdS5Pk5lW8SS1ysBgyNQfysYq+
	dQQ7CWFlbYUETpfddzv+14nwCsEo3tDMrYK+7qsw==
X-Gm-Gg: Acq92OHOOxohzXqIlFBicES33mWz6PdqLqRZ87/b6khRpXflOESJ6KTJ+A1lp3Vk3+7
	iO/ddJdN1WIvfowSnOkf0H050yWl/mMbPFnqBqDEwZ3A5duHJtj1bd5X1UPsHa4TLsCMzWuGROM
	CBoxPwa7fPJ27+Qv+OnVD+KyURRWpVeUl5/Rxl4wVRy7cGnjfhn7wZU0/TWTu2Lmlplvc8qGTiA
	tjkSW1VMI7/Vt+n5Q==
X-Received: by 2002:a05:690c:600a:b0:7dd:35fb:a529 with SMTP id 00721157ae682-7ed0f826fb1mr175041227b3.25.1781016362731;
        Tue, 09 Jun 2026 07:46:02 -0700 (PDT)
X-Received: by 2002:a05:690c:600a:b0:7dd:35fb:a529 with SMTP id
 00721157ae682-7ed0f826fb1mr175040657b3.25.1781016362226; Tue, 09 Jun 2026
 07:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
 <CAB19ukFFwm3ehzkBFr+oXRjA7VK_4_=XHFSuqdEpbVqUz8Do4Q@mail.gmail.com> <aifahCtdj8GpHN/v@lpieralisi>
In-Reply-To: <aifahCtdj8GpHN/v@lpieralisi>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 20:15:51 +0530
X-Gm-Features: AVVi8Cd9pzTcVntwOkdct8eFjOpuS2Xxx1qo-G3imlUBB7gP99ylMuHrty8LTZg
Message-ID: <CAB19ukHAAHp5kmm+5KBDqtn969h3V4LBr2put9hJSWphPS8jmw@mail.gmail.com>
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
X-Proofpoint-GUID: hX23k1iZq9O6KSeIESf3JeWcxahOooBt
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28272b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=45POYx1-RFdywSfKWh4A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MCBTYWx0ZWRfX8gV3yVHQ2b3y
 AJ0Os7M5in1/xZVrw7x9fL1xV7kCRcIZvOOQ17Gsig2dMqI68UQjj5rYf5DT4pA3meE5wQT7W0q
 lN8qMkI7OyHHCByQfGT37E6GmtceyNE3I6FrpKs1ppsv+1yB5u2NK9Wih840pBOe1AWHfH0xNIO
 bSP+QD4DEnbVSexh9sWYA0jJoje6Qpyhp4Ck8sIaKZCM0XyKAtC2YHvrily/moAImYR4rO96iSe
 vOnZBur9T6MrQS6piAYq8Lg4VjRy8Mvn1wL+ZGiIVOqiYK6Y5lTcJY6vScKzs0nZjXysVFJ5GCm
 pD23OlmJim9e5Q9/Qkypug1gwF5XjiVCg3GMOjLVakGcpDkHzRB5gqa2YUuyUN/d+V8pgQkSSfL
 WHp23cqE758pkjvyJ6o8TB4T7LS3clcLjCnhI5aYelbMBKBkbym6QDih/u0tMMcctAcDBkbnmsn
 RJONd9wqud3OTQkWnmA==
X-Proofpoint-ORIG-GUID: hX23k1iZq9O6KSeIESf3JeWcxahOooBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090140

On Tue, Jun 9, 2026 at 2:49=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> On Mon, Jun 08, 2026 at 09:54:28PM +0530, Sunil V L wrote:
> > Hi Lorenzo,
> >
> > On Wed, Jun 3, 2026 at 1:51=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@ke=
rnel.org> wrote:
> > >
[...]
> > Do these fixes need the Fixes tag?
>
> I can add a Fixes: tag but I wanted first some help testing them, it
> is code perusal that got me there.
>
Oh, yes. I tested these changes on the RISC-V virt platform.

So for RISC-V testing,

Tested-by: Sunil V L <sunilvl@oss.qualcomm.com>

> > Otherwise, LGTM.
> > Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
>
> Thanks,
> Lorenzo
