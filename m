Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925E368D67
	for <loongarch@lists.linux.dev>; Tue, 12 May 2026 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585822; cv=none; b=c9WaOC93KFxbrJb4wMBthkOUBCKXDDUTWWlrLQk0pTE8JtT2SmBnhe2tNE5UTzTj/fi6GVEPaqhB6G2OnllGGVOrQadaYD/v9nFjXDzQmRVjQE17KKB8ur8q5he8SL3dgrkmwiW3ogV64ID2PyVq43cB2owOFHIx5lZLlCnL5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585822; c=relaxed/simple;
	bh=8U1Ja8P+VJXeTYjM2KI07QBXve6dg9X7VaRLyfyRjQQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IbTSPtc+bDTxPc72NKsMhPUWOYL4m8FIigb0OyXnRxFtsPKlifryz1gUw3VWYCJcvNal7ycTDwE0yPKMBeI3mSzCBV/GgSLWnp1tWIWl71ww1Y8XWn7oM1IKZofusa4yaIBYdYjoZNWn2DAzikxN1x3vzY2M6gOeNJpLg2nHoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1WfPUjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMvwJviA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1WfPUjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMvwJviA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB3iHI2186676
	for <loongarch@lists.linux.dev>; Tue, 12 May 2026 11:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cBTDDbsITV08dA6vkggPs2KMXQ9klD2DkmQBC22iek=; b=E1WfPUjP8ZtMxZ3D
	YxwAq8EBI2Bo4lE/2GMs8Sf5KYGFXvg7CwKkbv0pmegVAqtxu03mFyaXJethDD/b
	JgT069pLF2ukFFA/mz+X0H3bL7XkR7ZdrWakwnM4+TAlh41UG7AwEaPmx4YoPzHG
	JVgE+qBYWmTtPJPnd3gUO3VH1mMn8pgPacGMV3kkeJ0B8P1OOLVYW844chuDNQB9
	WVHwsZOz5Ha3imG/TgcUpAa5fbdtY6fMM+2XTY0JEKgE9idEuNLEoYqzvHSiZ97G
	y0tmeAv6HUEhYr6X3GK6HZys32GekpDTNYBbcBBdaDaRm668NHOMqALwXIkX32Xj
	jSxi8Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0ty0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Tue, 12 May 2026 11:37:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so5537936b3a.0
        for <loongarch@lists.linux.dev>; Tue, 12 May 2026 04:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778585819; x=1779190619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cBTDDbsITV08dA6vkggPs2KMXQ9klD2DkmQBC22iek=;
        b=TMvwJviAibnjlGesP6EazQNAWBs06pOR40qNWNw1ffb37wvwbslkMhntvgkmOHP6/d
         X0zHSwKrX0AW+e62uy13QZE+w3xC9prMoharm9FDR0J7h+jY8yRA2SuOGBj1TdYV8o2X
         Y7x7EphsceLHQ/Yd8nCrHlYU0t+ugJFUnmY7z50UmfinQTjieakCWHInycPmpZlpER7K
         Ac6CbHHHpP11qTOTPDBKPNHSC/hWfYHEePDwA45PgeECi3QrvsW7faKUM3ECJjANjlqT
         EI+K/uaB3znGRuuGfb73JFdlJRp8tNCU5mzPkWa+5Xo7g/c19HGHccMpZjl3Yy78HE9S
         dixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778585819; x=1779190619;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3cBTDDbsITV08dA6vkggPs2KMXQ9klD2DkmQBC22iek=;
        b=FTl3Fl8JojtblDk9kHlIPynjsF5MgahaRDprr2dH/kGRiE4ADT/eAlCu0hx+NrEgYE
         PFm2r3Y0Awd0b9y10n8waqVWk6xsY8PKPxCC2LSKQgkXo0XfrY4iZTxTN68BfeIPrtkP
         OTws7+lCFJj2hJlg9imvfDu464cYL6r2HAAl9XwHaZxfmu6XsUCJsAjUZzIEFhL8n/kq
         EVmz4+5Pckpzlvczn2xfOeL6XyScGT1x/b/SAUq0QTwhZRDnbJCxGCFmJ+mIrZpNE7KM
         1VxGbvn9S+LITdaa8LY8GRkilJ541en3Hz2f3XThZTKhEXYJapP0Ls1Ooowvshf1Was6
         E2Ww==
X-Forwarded-Encrypted: i=1; AFNElJ+qXwrCeWdgYFrikEwx2gGj/72Yrrl786l+kvNMHYAomOJp94qE2r2qqaKTTVNDwzmSzVYrdK4TJl4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgkvi57qVFnlp8Q1TwdVi6xVI1N+jegaf84zZwctHlDKsal6q2
	PYoTz/bHvbdpBLdpunbTg9HNylU5Nx4WFgKTlejQasPZlJtMvjJgNdFPjzCh+SVWCcBRhcExaUy
	IBc4vrHbXlEdmL62PjUSPlg5hllakW45lZe7wSB2Xj0Zk1F0WGkKidz5/ZoDKktm/aZhz708=
X-Gm-Gg: Acq92OEo23B7BPE5I8e7G/XqPi2nKFyQuEjDblMsZvYpZTy+DqQyqK3WRCFDsp2CKV5
	iN/WBDRmQEODfhBtpYDt1cj1sEOINSnzC7/3gOoc1awQbd/RrMilSil37OAKpchV7YrMHgCjRQJ
	gmCF2IB/q9+/Ibu1j7Zitf9EAlTRSEvuqHi6/ECW8kpPgbYt+33ZwELUkp5oqLivYo/IcnoQX1Q
	JNp/QxhnD0mdLdEvaH7DOq85uiiP7txt0S71mA/d/x/ZzSU9GvB3/Lrnj/rB4YRqh3gJD7nbpDC
	JI4cAufjZdp27BnI9OIZ4r2Iv5U7REQVpWpDF4XTSSWrOforKa8bVi+A1Qu690mVE9MgLVAqm5B
	VncYAdrwav8kyBO+ol+UV
X-Received: by 2002:a05:6a00:3309:b0:82d:162c:581f with SMTP id d2e1a72fcca58-83e3bf8f281mr15611642b3a.48.1778585819178;
        Tue, 12 May 2026 04:36:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3309:b0:82d:162c:581f with SMTP id d2e1a72fcca58-83e3bf8f281mr15611600b3a.48.1778585818664;
        Tue, 12 May 2026 04:36:58 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f38fsm22544280b3a.8.2026.05.12.04.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:36:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ziyao Li <liziyao@uniontech.com>, Xi Ruoyao <xry111@xry111.site>
Cc: niecheng1@uniontech.com, zhanjun@uniontech.com, guanwentao@uniontech.com,
        Kexy Biscuit <kexybiscuit@aosc.io>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        kernel@uniontech.com,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Lain Fearyncess Yang <fsf@live.com>, Ayden Meng <aydenmeng@yeah.net>,
        Mingcong Bai <jeffbai@aosc.io>, stable@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>
In-Reply-To: <20260412101731.107059-1-xry111@xry111.site>
References: <20260412101731.107059-1-xry111@xry111.site>
Subject: Re: [PATCH v8] PCI: loongson: Override PCIe bridge supported
 speeds for Loongson-3C6000 series
Message-Id: <177858581215.17835.9314837252988039944.b4-ty@b4>
Date: Tue, 12 May 2026 17:06:52 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyMCBTYWx0ZWRfX4zkvA7qdgN27
 cbOjhaHB+WsWt96jlEMG68c2KSWDVYxQBrqAmJU1xVoN61qaRqgwuBfdoTdutT1qfbcoWei101/
 JuFFAC7DaeRmHbMntJqoSSWv8okI17d090bzNnO81SBnI6Px4PfZwcPN2P8vSbWmE7eusfRFYqi
 elx/eHHmMXLrDnaIbQQRu0JBh9ODYmwUM5tBR+/c05/4ntGxTXOq35ZgBEmX7hg8mXOmMv14L+Z
 arhPQY/apq6cpC6l+LgtiRaDwJ+pGcimRzS2aZQ46U7lL7wSBlEs3jdjyzkM4ecPczY0DjAT3E6
 KIrJi3BaZ9xVgJ2GFxf2QKQYxnUVkgVB8aI5NQxpCwybpXAhB0i42oz3oS6jC/bi5OKiO5iF5qf
 Ju3Rl4i99PKRSHrtYEMK6r6+aJNYc+W5XpW2xQr7hJYoCg907fr08hVH+41Y0Oa9NN7gbxbZa38
 POMZVwVp9ihD/X3Dk8g==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a0310dc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=P1rAUm4iSsRH5tYQsiAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: DcRfKTM4_3u7EX-P0JoS6mxEajauL3yl
X-Proofpoint-ORIG-GUID: DcRfKTM4_3u7EX-P0JoS6mxEajauL3yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120120


On Sun, 12 Apr 2026 18:17:31 +0800, Xi Ruoyao wrote:
> Older steppings of the Loongson-3C6000 series incorrectly report the
> supported link speeds on their PCIe bridges (device IDs 0x3c19, 0x3c29)
> as only 2.5 GT/s, despite the upstream bus supporting speeds from
> 2.5 GT/s up to 16 GT/s.
> 
> As a result, since commit 774c71c52aa4 ("PCI/bwctrl: Enable only if more
> than one speed is supported"), bwctrl will be disabled if there's only
> one 2.5 GT/s value in vector `supported_speeds`.
> 
> [...]

Applied, thanks!

[1/1] PCI: loongson: Override PCIe bridge supported speeds for Loongson-3C6000 series
      commit: 72644ef266d2d7c679d1c8d8dd7ff5a7ab2171e9

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

