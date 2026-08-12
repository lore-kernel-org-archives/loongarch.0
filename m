Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C031527FD4F
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523599; cv=none; b=jtgiE6/AbzDTayuR8qvpqd1M5/y+xQDqs1HqgevAY+TX7pkSjIIrYYeyBNfyQJ9T+0fQo7gYnSAmL7zmmr4MPmd0OV9fxm5vFShCgspxgC3vJh4dQcZuzy4dA+SL2YdEH5aH6dqNXf3oGF/7SvL+sg8eD565VNlPjHb9XiFCaDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523599; c=relaxed/simple;
	bh=AfnvPvByM7NhMG46kRUkDxivAFcGgmGj9xeqW0owLps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDj8BTckoEHCDMGLEdPCQnWc2NyfLn+jnnhcBqONOIX7cUcC7c2/cmZJDjG72/K1RDtM3qsccLbAUTJ4CXO44Igh5Y+91zaPXHiFCnvXcTQ/9gil4dvV7cVilDZKRAUO1tBMWE/QAm+Zddz7Y9TliV1IKDNXp7v0OeGikzoZSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMi+xbV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur702FH6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMi+xbV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur702FH6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62ZAa2948768
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=; b=CMi+xbV8rlZ997l6
	8ymfyCRnjTVDNYMTFbQHDvUOjeReWM0cMy1Nw29jxh6/EDU8FzIYaqrlwgV6Dugn
	Th7xAreT9RbRpZiaZNk+Ysied6XpVbJFURZv2SgQTM/+JG5tUZWc3Lr/c4Vf7A5d
	l6jMNpk5fMu0/wKwGbZkUeDeUixWNfMRkRazXLD0J8FxCUGrAjjVIhnO7GBU5dQD
	bvumQhfhc1mO+doLBf+WbbcnepCS6H5Ic6uwaJaHFNlixse9tH3RAXjawBbJR5fQ
	hO6a5Chx7vTh8a3CJdlOdTlrQnchK70Mpj7t7/gHEA8jL3rmO0tDthA+ANAZEa6T
	OdEjbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2rxk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:33:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so11113701cf.0
        for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523596; x=1787128396; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=Ur702FH6NCogaJSsHgIWUd27oIcCCMchO2I8gKnRWgt+v1xFJT1SyuatTG0xwmXZKF
         UO0JkdkReOLtReYX2kWajza7Q/SWz/XpUQk7pdyVZT3+yhKfgQCGEkmuKkj7mtwF3Wse
         1035oKlkyX2gk1lCDDM9Clb+3YPoC9r5ySkmZR9+YpV+Wqedoxq2QL4+jTmVJ7K7xI2S
         +c/1J7mIK93H288bZJJ6KuKrgmEgpOxlxRt8A6QNT329bamTyLFKk9PopQJ5GQQrjF4W
         TZ8EQJjbnG+Cp6I7CpwIqRcJwDlowjIRdyRzS+iAv4iMe83Qh0yTnwQLuqGZx6g6Dwn2
         JS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523596; x=1787128396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=WyPN1lFgqIa31BO9KIJ0sVM+G8zn6Je3X7kdJpP1jGRUQRGVvxRxax6QySLNIfQapD
         6NGtDGKPbFvvDVlBb1QFFlTbh16luh1OXwJC1RiZbCrn5uIRv4tMRn4SUs8Edmi+JIAC
         4OG9n+MaO32XLYmcqGVGdo9EZcWfUgeWXOouooJPLwnM0SnaYO4CLAww+tBndpjFOfVl
         ieHE92C2ajurPBBOsljAjqHPZGdsBACV2GjOoR5AUNHMk3rejfaBa/3YfUyeS9Y6eA9m
         uSVqzSe0jiSwvudAItJQYxokYX+p/ntG6jAFVcalADSb+1DArlfkn1fspewNu27kbXRb
         x+eQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIK1SwKl98Y/jHGgBT5Lh9/NWkolM2TXzn2ITMUn+srYODIx/FjWc7b933i2xgNkNDhkHvbrdiezI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3QuZ0DGCe9U4V+8OCHbC1DBA51mFSlzctSW2HHg9FlUdkiruP
	fQNaP+Rk5EMzUYenO3YOlGdMQaBh3vaFKMmd1PqHs+qUyywiN/yy+/ky6+1fXCiqxDsLKFAYTb/
	0rTDhk5ILd7Cy1eK2E+B9LJEdwiNrUe0L+Gh3qdIJ0L5n4hJ5Imt11uEZhNAQZzs=
X-Gm-Gg: AR+sD12wvDafFz44GNV85vUx1jd6exDRBP2iGtwxMap02zh1V4PzuLOb9ZoVQHexvnY
	3oTHxCSQVwLE++9l9okF2Y/16/BkhjL9AR47sO/VB7YYEWBMpgnHsHRWj7h02dMaBblCtMXd+mn
	FtnLIigevhT6rLtUXwX5BcOBchwSboxWpmwe+wDDhxcJuktWoUF7C4BJVIR+6bKkDdLf5KS5IEj
	+S53xuS+U0DOnuYpETlEIzrQV7Qzi6Qw4OaHovi9rSivoXAdxuqU0sprXGJqZX5txfy/U7qyWyy
	NgTCtX2QyWp/Er0PHDD6OgyKMIrBYCXVlooLcwccWmKGvMj9N4pXM+5/FDEtiEI4VPBQ8shtXve
	sMQTlJy8/3glNTFzQ4qxKRkxDbJQpAwJazUt7UtxYGHGkpme/pBcCfmzf4FqPjPI=
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115421cf.38.1786523596203;
        Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115061cf.38.1786523595799;
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c998f27sm28031395e9.15.2026.08.12.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Message-ID: <16d3f0b9-2a12-42d0-93b6-b9da3f540256@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:33:14 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c2fcc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eCx_7nzpRrifSLxMv2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 2U4t-a1yP0IM7WTXJ0gMPBHSlOdpzW4m
X-Proofpoint-GUID: 2U4t-a1yP0IM7WTXJ0gMPBHSlOdpzW4m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX+k1x86aq0epN
 Co2CCXvtAiIynuDXJfJOI6LaaQCw20F6DJQl70e9w9NUDVItfYpWEtXamXxDvmCn7NBUIZhoJkg
 aZk1I1gl00k6uQE4JiK+ofknXnB4Pao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX+43065lKUSkp
 IbIm/++JqxcTNlKbx6Q8vibvhHvMC4PI8f2WkvGtVFt0Hc4EphdqbLhsoopbUaTcGRyLVxEBNbi
 nAEKP2/wlY0Bvt5iPVZ71kG93pemXNBopsR6uVjdH8UWA/v5g9adEkh+oYRUgssBGMgebNlcyHS
 8SUfipkbDjryHmNb2RNqqSnXPCsY0vw9m5FACdmWCp6yBPddTnLkIzoAWLG5LETcJ+oo/N4mQmT
 GdV5aAAL0WDQU179iflpg2VrIhCcK71HnzC6noSOW8IgG8i4bj0z6GjD7wmxX1e9XvJlE6LbDtR
 cbuAkaYbhzYAnB+RuwBNk5pqWZE/c1WlyyfixkVLEhyIJxUPJnPPru6Ex5i+6q3c9BhSk4u3hPa
 tZoECMIGxx6tf7ZZUGbgEAcYrSC6n4EUIzQ6OmMNn058xZsyDTdrcNqlT8dyIPIL23b/Fv00fEe
 VQ+WSuVHtxGvqQ1c50Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
> even if no vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

