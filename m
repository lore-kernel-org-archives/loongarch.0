Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801AE395AD8
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881447; cv=none; b=AGVFUAnrke/2N9Zv9W4+bzp2wlV22tO5511Oqe8JoV2sHfnf1XoZYp+WWGABbgBimHTrfzftgbDYipBRxEWzOZm9VAFpu9DciQtPLrSGMA2q4P15hKZW3++OsDOKeXrLq6QYYXHhxcvBGQAMfzPYdCzLkFKMuDLe4cu4lmJ75QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881447; c=relaxed/simple;
	bh=rrsiypGh0+gRn6w3CWCp3ePyqfW44mmQknjAly7nC5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAO4iMz30NMa9YVIQ/YMkQFDXUdMODn4l3HmmuW9fwwDZWufZWzAPgFXRsLZmcySCwSHUwR6f2IORWqBo19nJOd87kAg4AjIrY+1hSzG+xYGKKBiijBKQAtpaQa5Pp44cTMYwdLIqlFZgiiTEQXtLVHYHZkwNst8V+gDoRRO610=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIj4RWeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLTVMLXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIj4RWeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLTVMLXz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8jqAq302932
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 08:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XlN+IOV4cTreUmbElrbiU6XHdrsCIyblNEqpVHZhJMw=; b=iIj4RWeTko9Z9QnC
	YzjnKJocE9i4x8nXCIQzeeRxl5s/7iz4xAfsYDrheXUYWOmA8mIgx4rEJCZ90M7u
	VRU6gjdwZ3NWz6v7ehJUxoH231ozL32mOx3KFmajAy5Xta+EkcukXv+KjRUTwJ6C
	hZHy9R/7tria0QW+STmCFtqQU/SXBAbD3N7YTHDVLg1jRRX+nWkAgLSvFHoDMuNj
	HS0M7reD2DPpc8EfXy8eDlfWe+wRqbJj9pWsY3FCgrzB7/4PZiameJ2qoLqzMJ63
	O6FQu4cnB9r/b3zYi7PZmTKta0jN9DtydcSsAUgBhLtiSD+CnLfkV1NqnfB2ogjh
	xK/cyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9y0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 08:50:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso296448085a.2
        for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881443; x=1792486243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlN+IOV4cTreUmbElrbiU6XHdrsCIyblNEqpVHZhJMw=;
        b=VLTVMLXzFJdgprjYbe7GR5eEFe9yLevtod9kzbIakZIygAJvqraEInhHbBH4fSC9Ng
         CiyGOtw2em4v00gu71O7L9EFpLnXwfc8BKM3tSksBERDR9Te86upe0kUdNeGFpgG3E1U
         56O4ntHvCSyMf4H8GXvdnW80FT3bO7a3eW5WDK/be4Gh90vKrf3VRWf9QL0GwfCX+IkX
         4SC/nWVZkruDPRFmdlj7/+Q/fcum7MT0n97XlfBIMGu5wXH3VZF8KJWap4TrH0iuJ/9G
         7G2m7QqkbnYFJ3bGy5kg1I4EmmJphDGoSSp0lxszOOwtjjE6Rh6NksbVUQneA7nLIhxI
         TCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881443; x=1792486243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlN+IOV4cTreUmbElrbiU6XHdrsCIyblNEqpVHZhJMw=;
        b=pCHjMUSbKDdg4tBgWUxkQQS0MXOH/7rJm0ExnQugsjp4wY4/2dzAC9EtCKcpv5ESqf
         8ao0MzNJyNhUnkfkKQtMNn3PU6W3tfxJWCvrFcU0iZs8n+2qRZSkzd9gLRHhwQ12TsxS
         Yyvads3sTQ01GUyR4BoYPOflDIYPqjVysdD7WKS5p/bdY9u7up7YaD7BLLEYMszN80EA
         L4LWSJIP0ApAlx2tzlIJbHMUobmOegKBIUuCSzl32Cfk2qOgvipYvtWpFi6zibWp18U1
         ONBp+IzD/eVdzd82VDLEONY+k0FvPXCF2BjbhyiYRZIpnevG1QaCZyYC1C544Wot6j/b
         yyaA==
X-Forwarded-Encrypted: i=1; AKwUvBxzA1+AKWNIFgjy9/LLB2hOem3YjyzAKN9zL9BTtRnCi+Sc9WZG8iTDriMLl8JewAomouZMxZ+O3Ao=@lists.linux.dev
X-Gm-Message-State: AFq9FYI2cWEBHJNgIPvRgEtq6E0taNc+lFwXpxksxVSniWULLC3d0JkI
	3MFwxjt6cK3WeyRIoU01VDSYhEtoFu5qurAAgIplWNE0hS2+gGB7U3NhS2blIGawULrKuUFA/cL
	aPZLA9OlmrJ2bc8h4BWULJtyfoMpjix6I2NyHTauqLxs/+GUnA61sKEyZiVofUoc=
X-Gm-Gg: AYBFou3qFhuA9YIQXqig3NPLE6pTeVvazJSOcIRfVkh5YBe1xEdVi1K901CgU7O8rx/
	ycC2nlADa9VIUb55FGRIMLxuZSHf9Rw2TUsMXOSMJfnhBpu1d5636Lp/1E2z7ee0vnH2qyU/A1y
	DxYNaoTVl/fLkm8/s25UPNKAN+E+wab8T9tMedODynOkFQBWY4W+KJGf3nCNYWPCWcestlVPQNa
	JPI+G67R8UCmlJGBYlzqKbdlcpcRXOZQTtpxmOlx0k5GHQlog7YK0AFvhvyYzgdoPLY/P3P+eEk
	P8H3aJkVZRNGJo126s4omX8iPrUi5iiWeWqIGr9+QGSz7z4X25PiopApRhym7QFkcWu0mrtwnoM
	7JW/RQ9By2H7XeSMt+R/udRkVukTDyFES9uyMl3dezFX67LphS8ev4BPCmsyDAw==
X-Received: by 2002:a05:620a:400b:b0:93e:c12c:fbca with SMTP id af79cd13be357-93ec12d06bamr1573656785a.70.1791881442692;
        Tue, 13 Oct 2026 01:50:42 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:93e:c12c:fbca with SMTP id af79cd13be357-93ec12d06bamr1573655185a.70.1791881442030;
        Tue, 13 Oct 2026 01:50:42 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm370949065e9.11.2026.10.13.01.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:50:41 -0700 (PDT)
Message-ID: <196b51ef-835e-477f-a46e-575e37bb17e0@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:50:39 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] thermal/drivers/loongson2: Use bitfields and
 per-SoC thermal ops
To: Binbin Zhou <zhoubinbin@loongson.cn>,
        Binbin Zhou
 <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <cover.1791512067.git.zhoubinbin@loongson.cn>
 <1375bd12403bffc496261953772a45833f9b5a3e.1791512067.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1375bd12403bffc496261953772a45833f9b5a3e.1791512067.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX0wJUO5ry9svp
 wATMaIXEzdSTIJFd07XDQ6DMFE4vMq2bsJGga6909FUyw903Tm9+1srRnnDwIOPdOuyFJT290Bm
 cUDGurmZocQO0fgl1IqyBcFTG28WURGvNHQNwRIb9vgSOHoeQL2gOMVReeUDlk1H9Tbg0K8ausj
 DaB8UDUwuhxbq3K26lc/0HOyt1/8NMpy/VesTfUEwwYGnJX93lXnk3mVIMKeViuU9jNSJ6zq+3s
 l7TwQXCFTB7xXXxZ2KL62cZ+MgaQGsYbIbS3Sg5xolOKsz9Dm8p6E/1D1/JhnKvD2RCzvxEV89Z
 JfNzGhQgdLODOp/q1cp5NMXYjoNxJSntx0HBs9SVT3iyxqVL/UaOotoc0OKDewYv5cUgadpowwc
 OuZKG9zWnv6JkVQ7eUsc9dnKQZFMTXrdCyl+xsllyppNKLU55O4m/WsNLBpdWosW0xC8gcanhp7
 pRDUotxz7LA2L+d+3Og==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdf0e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ua90ykTK0mPAOTE1wUAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX4f7unH8PkVPV
 WUTaPjLO75gb9Nmh5dOhoGNHDgxU/0AOpurYFnz84dmOnqHT52+BzVue77+RecnQTVksQtf7pYb
 kqDQynkuSr+x/ASoc540WSf1umiKSpg=
X-Proofpoint-ORIG-GUID: fVAlu3tiCP8esr6i2EUjw49rbzAAQd1I
X-Proofpoint-GUID: fVAlu3tiCP8esr6i2EUjw49rbzAAQd1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130035

On 10/9/26 04:58, Binbin Zhou wrote:
> Replace open-coded masks and shifts with GENMASK()/FIELD_* helpers, and
> define named constants for the Loongson-2K2000 temperature conversion
> and trip gate calculations.
> 
> Split the temperature read and thermal zone ops into Loongson-2K1000 and
> Loongson-2K2000 variants, and keep the chip-specific trip register
> callback in the chip data. This prepares the driver for further SoC
> support.
> 
> No functional change intended.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Please use the bitfield directly in the previous patch


