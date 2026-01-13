Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8298277016
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311158; cv=none; b=I1v4qr7AoRQSeIAlJwO34uUnVpw466yLY4d1kyLOvA7DTf//1jdi6fsoYiF0ZkgcOfiS0b0Jye9a8+TeIVwTJbrP9W8/l0B0S/JpeY4vbExa9tQMEnv+yV2qrF03ZPi9OFfK0V5adaCQ8YyqSINQNk4puVe5Jg02nOSkxZ0o77g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311158; c=relaxed/simple;
	bh=iaesIPrqbVwJjFyXUeP+5jmVglPcQj+vLOMaszr3DJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XHhFBNHt50RNAFNkW671fdF7j6WrU4O67/nxYbUmAG0TTA/TyoUDpg7stj+AdJXqeS81btow/Cz3twF22z0Z2p7EJ4t+Dz0wx1eJZLZT5qIbuNEQa3jbxEuvaRkIvH+b55LBHeg9iVoSBu705fwgFoBUJffxg9AHoYJ7+5TAX6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4cvxJbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiIj6vwL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4cvxJbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiIj6vwL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBDb1T4164886
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 13:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8TJC1xR5qwjZdXuz/Ki/VwolLGb9COznW5/ec1379Y=; b=c4cvxJbIr267S+mx
	bxPq2sXOacnTkPP+w81iECdR2hCE5raPuh2mmO5lrX6G+xNqXep4ikcTC1WAK48Z
	roLTQ7S31cud5mfDw+nNPy+hgfdT+1rceD46EpMiwf7txhVXixtk4Lesx1t5cMBP
	8f/dEYPw5HgUUV2wtj56gjTA+Bcj7TzDKXH0ZdbwMT0CxROfkxsZlcq+1aEsgHi3
	LaCenOHapmi3MhW6VQpro1OSOySXf6PVC8xJsGqHeNBOovKvKDEAKh/mC9ZRgpNO
	8cVuqU5Pue22bncGpQ/grOy5kER/xZnYnUceiMzUh66hCt/BrxzvvynagUD7U5Z7
	mf39nQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06rcrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 13:32:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c5269fcecdeso3046510a12.0
        for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 05:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768311155; x=1768915955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8TJC1xR5qwjZdXuz/Ki/VwolLGb9COznW5/ec1379Y=;
        b=FiIj6vwLbL6avO1d3kSuGDCSuL3VFKAzafV3vfKNk05X/YnSkjXVp4/N4/g34Sk+ta
         dMHks+If4QXuVl/ILU7cRSTbTiMQqm8LM7kvZWboxn7gacXuJyvoPetAiik5D9TaNxwE
         k4j3hofAi4lbW5Wiu3EHjZbCheqKx/D2pDpwuA1zrM6+JTLLkjxIQJYNfewedlK9cDl6
         Ofwm6RcKP48v1IzCWZL96RjmKO2ozE2+g6FqRWT4Rhf4iSMPt7Cj/WN95k7qNzCg2mDU
         yNnMswXqO6jfSy+W/3Gik+qMEiZl/bYkB9wi+fiVRPzMlF3al5WFYDyg1jqS6MREbyH4
         4AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768311155; x=1768915955;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8TJC1xR5qwjZdXuz/Ki/VwolLGb9COznW5/ec1379Y=;
        b=ZK3o1NeHu6rDvW9O6PojsPUaqGh+er5wcp0RIQNHE1ru0aaz8AOrHWuN2BPp9V1wiw
         S8gmKjjVB/gnQrn1EUW63PcUYPqLxXK6BYgj6yd+IsfNsSknFKhYGN09qbLTDQoI20x+
         /tuVkXgQnAp78XqrJ7l+I9ni5Cx9L/Fv3ObGjfVIasKk8pq2ckIGdyZJwpL/o24WBS+b
         JWq/+8Py/UOv3jEvjlZYi1uX7e6YZ/MyMrInw+YREkIeGv5+7+L854EQyNUgQ+b0JA/K
         6KQQhfgCGzla36/FVb5Bcl/xDLKBiu7/0WfhsLOha9+WJ3S18bCcEtr1ml3XWH1WX+kY
         IDSw==
X-Forwarded-Encrypted: i=1; AJvYcCXu6DmNBwPRYIWvpXXHpGJnXnp2OeysTiJydlH/TcYHs7oGYueg8u62Er7LM2DnCpoLCcaUSszaJxM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTlVVLJXv+HCTo+0j9ifMZnOc9y8skViWp9LRCAyeBzWtQpwnO
	8EOkBGgqxgnF/Gn1aGyKv8MAsEyYKw+U1MPbQghz9VefWPw8XXYyHI+2Vdkw+HTFxtxo/WatH7h
	Xvz0+gOPcuCaK8oqrsuN7ws/n2dzKTxyvvHqcIheuhyykXDvjpCGqQTpA4huFU0s=
X-Gm-Gg: AY/fxX4KDstqmzjhXBvWoUEsBqHUGvaSB7RlYGL7HrwXeU8HZG50qnbCdhnLB7nYAfI
	7Lv2wXJ95NH4ZX/MedHUjHIyUC31zNPlvDL/sLBo+UTvhjM/h2BitYkqUX8x4s326jPpy5uNMsY
	oEPuIrf1b0FbACGS2TvbPmL/xNn8qxJXceRGCYS2XmP4U4QRg19ApB5/BOIf0PRecf4GVV68Hbl
	vz69CmtU9YgCweJmJMeAKmh9P2PISYDkm/pa14+t16fqrF8OPfJyYIDrbLvYT2pduMeWzYPiRps
	p+iU03HZbHgyCJ21+obU/YEH0MBzDSZtxLvLXxZqId93t17vFqZ85y/Kscl6m3inNGKeJ9ycC9r
	ewplZ3dmw
X-Received: by 2002:a17:90b:3a8d:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-34f68b65de0mr18289149a91.9.1768311155360;
        Tue, 13 Jan 2026 05:32:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQSeTTC0e5zR0aZPRVtYeUvCiFIncOpvm5d1GGOQzzdJx+WVyV1lsQhT267/6cpb7RuZ0E5g==
X-Received: by 2002:a17:90b:3a8d:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-34f68b65de0mr18289130a91.9.1768311154759;
        Tue, 13 Jan 2026 05:32:34 -0800 (PST)
Received: from [192.168.1.102] ([120.60.62.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa78ebdsm19939128a91.4.2026.01.13.05.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:32:34 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>, Yao Zi <me@ziyao.cc>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
In-Reply-To: <20251209140006.54821-1-me@ziyao.cc>
References: <20251209140006.54821-1-me@ziyao.cc>
Subject: Re: (subset) [PATCH 0/2] Fix LoongArch dtbs_check warnings
Message-Id: <176831115031.476677.605007474581802284.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 19:02:30 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 5NrPmBcg4Hv3CqZLKWgkGhbYG8QiTZe7
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69664974 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=tlgrONNCw2HA119KiuRAjA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7KmsL79GNCPbkX_oTsYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 5NrPmBcg4Hv3CqZLKWgkGhbYG8QiTZe7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDExNCBTYWx0ZWRfX4JfODRD2ilpA
 QmSR2ABguRIwjHtf0YR7Q/dXvw9O6ExZvj0w7UiZav+mqRNaOVhN+c6vL+Qu/nas7h8scCSK+j1
 P5OwrMw4QimEI79SjtuARL++qX1SFiN3vGM2/LC+BTJG7YZYsQGt8NR2XaQ0+r/QPVpIzmcj+ZF
 USv2mM682d+KwKIiq6b6OAyvF61XbYlG+u1A3CBktJ11Xfg1ZtS5bhyNGTYH+yH8hYUz/+Gyybx
 tGkT9779usJ4GKvcBVaZ/JhqMm7RpcM6H4dkrTDpar9l3ByaVBt900HxTLHktGsdJVx3geytOOa
 oki3NEC0ZysKqJup7H48l6jQ9SBSYDqvl5IT7mlFa243VRnMJbGgBO/eNUxzinnZeMoDFt4WjYr
 zn7M/6vX3lcnvU4tjYpnA4ocqd2YGLBYUqVi8xkN2DDbwfgsq2Nsocg2U0kzZpQd0SGFCN2zffX
 3bXGboEmh30Nvr4aTPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130114


On Tue, 09 Dec 2025 14:00:04 +0000, Yao Zi wrote:
> Running dtbs_check with ARCH=loongarch emits a lot of warnings, most
> about describing sideband interrupts for PCI devices through interrupts
> property, and usage of undocumented msi-parent property in pcie
> controller in loongson-2k2000.dtsi.
> 
> Patch 1 solves the former problem by using interrupts-extended property
> for these devices. I don't have LS2K1000/2000 devices on hand, so
> helping in testing it will be appreciated. msi-parent property is
> documented in the second patch for Loongson PCI controllers.
> 
> [...]

Applied, thanks!

[2/2] dt-bindings: PCI: loongson: Document msi-parent property
      commit: d782e6e7aa798a2c28f30f984ea6dcdb63f51674

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

