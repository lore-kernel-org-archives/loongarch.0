Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B7395ACC
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523570; cv=none; b=pJV6xlDhMUDfkZJCm6g8m4MlnRKDlEoP5dwr5g7gUOZ0HIgSA8w9lRGjlAK7cLWmg5J+9XwGRK1UaijF71wMukbiI1mPVz78yLKlh45l7QLgKdIM7lv60XoWPJWcI+R3tBVaPfANYDBLPonsXBF3PAA0GG5LZnu1bTPgkq7/CUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523570; c=relaxed/simple;
	bh=cEKiSBw2QbvrcAeKiJosKgJ2MZ1tbNUAgE61HVjHyJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjJH7qJYK+8tuZJgX+O1QCXHz2Q6mKYKPipC+C8zN7ItS0rXllQ4jVGmg7jzynwxyC83bAqWW6iEZanqfCMytzcRtKNW5tTH9MEA1GXW3q3eXeV4uMBhPTqlMA77YRXNuR65ZMO6VSTi6JbV8OJ58qMvYcyZ/EGQaNEjP6f3Fyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkDL8DAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmtyWEl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkDL8DAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmtyWEl7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62Wfa2872453
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=; b=CkDL8DAQ7U5HJ5gu
	1wiZk6P3XYhm6d4d9Pl6AKoAm0ojpYY6+9yiDJZDagzLZQTj16HDJomqpc5v54hm
	GjSEyRKSdQVk2j9FpqyOAoeTrOP+p+wWdbUdRWU/yYx0PWT8D8Et1aCgK4asxrLu
	BUA0QVwgeHqElbgMD6ra5qsvjO5su8wj1OYt0H/jivqkQ2lv9ithdF1oBONgCcid
	f1xHlOKmxkuRrcEQW+w3H5tgD3Dj6/hJFlo1HgELfglRLWrUSkx5BHrqFLUnHTIe
	s6AnqvpNyLsUsHayG1koazsaHDRh1sv/8JPb3KIjgGv77U1cYm15NtMwmv6XYC1y
	Ee1l7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1gwu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:32:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so11107011cf.0
        for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523567; x=1787128367; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=;
        b=BmtyWEl7pnIeuzcYySKs9JlogIeLawTVY3KDrihZ5q4gPDL+gINHTY+c5CQ4sYdV+d
         yyGj26j9GmSjpUcE1trHR+PL5zraQuYfMC8EUTlEPlqdpxZ0RDkdFjZojqqdtvG+ayvu
         LEtC32JkSSk06cVrqr/8webqZqzabZhFzNWt8shcUPmRBE7whH+HGUBKufhKUHKt5xYE
         /LuCSYpkH/udFs/qVbv28jwijY2tIgueBu3kAz+2Y93H44tsm3Gp77RLOVc0TvexH1Ya
         7TXuZXmz9y6VwDvvH3mKqHlUD4e9dq3A5CiZlVkW4oC4W5wOBepNj9U1qyNOoExV296K
         hhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523567; x=1787128367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=;
        b=O9q5Ydf6agJx5l/6zNsuxYZFyl0v76a8pfWlmXrn8wOCaI8x2tsmDuna1xOE8IREdf
         NJUV0BE8O5sDNGrdd1BknShhUPRak0E1oi7bMElqo2sORttw8dXpYZ8k3RFPwmvif03y
         6GW4Y+pAjeUpf3fF07chwE0eLBkh0rVx4Z6IbLqf3VZwr3ngs2aMpIoq8KVzPYmH88jn
         +svNWwVVmEnwjiYHLqwyCH24d5Al7ZwIZatODH5M0EmzzRYWWVZs4y+S/wi5TNKpDPLp
         m3gTVqbXHld2o3VQnZYiM4NQBQQ3jfBW2glpR4aiYGmYGrjBRQ0KAv8DkkgiHnyz/QQk
         /3Xw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0qAFpSb0yJNpDJ9+iUZ/FW3HplZrJvS69Y3o6V93jlgnM5Jt+q50eEanUi8ZUyo9FMNZmBW4zXVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5DWozX6Mh27XOhQ3Gz42EUnK++9NQObJTm4AYtQedbNwqpHKy
	qyrADTx6Niku1MQzmES7PLnNuE7269w/V6/kucoLAarnTEEGOfKoqnI2NweFkIJkNZoIvA70SX3
	MzlM2VTgeRpRMY/UVrL8M0ud51RHa3nzzPsKEPfSnT3YwBgwr18XKQJEduTshypI=
X-Gm-Gg: AR+sD13elLMtd+DKzaSxE62u3iAcK6g05jrelnVG0OjCRohCDidsjc7zcADwnGbzE7/
	b5NFUitgx0xBZBdadSFbMIEhTRxr7Oh54vTXc7Rf1Q3fdYGkYoRrIh9z+ZcqtM/qtFzhDdCD9LY
	3j7vYvQaFhjBOaG5DGkT8KjH9YkkSfo8ARkWyedk5lObiMbWmuD+u9ye3aiRNYYLMSCsh6mNygu
	E+XIVYPKONeYoshbDXGnpGtwZGWLPWZvybpFfAR8RzOawkthT1NfFi/fflbk3LwCr7D9SSnk1W/
	1uH9MW+f/m7gn0Dzwk1lVi0i6AcMPP93TdgTtUrol1XhiGiZOmtt3/cLtio+AuvdVA4TptJRtZh
	N9e8GVz8Udh8jHAf3OGZcp5ALvSeSrKXo5TMjyjTOMK3ip78ZefFORbyfikA9lPw=
X-Received: by 2002:a05:622a:4d91:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52d6469cf4amr25908861cf.5.1786523567366;
        Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
X-Received: by 2002:a05:622a:4d91:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52d6469cf4amr25908681cf.5.1786523567010;
        Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c8fa1c7sm47131155e9.0.2026.08.12.01.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:32:46 -0700 (PDT)
Message-ID: <447b83e2-5bd0-4b7b-ba4d-61a0fe400195@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:32:45 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] clocksource/drivers/arm_arch_timer: Remove
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
 <20260724-vdso-arch-clockmodes-v4-5-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-5-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3e5xEwD4tTdRPGlmzOfiE7mTstAZDIjU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX9GtPSTxafq6r
 v0C8rYpQM0SvivFN++ux/cKp7Z7Xw5/i8HqewTqhrMboer9Z4QmlBrJmXGSOR6z5hu5BI3yx/Zk
 akaWtJifYmT382I2uAZ/SWKTlcdErXEkN0h7cPaat2tJe4iiKTTF3kxtb0KmLyC7Qtxecmk6Oei
 jG9M+lzGnUmmU6TGyqJENNKnTrrndf7z6jZdl937akzAyJhtwQx7FUTJCVgyr2o3JhUBddebHD6
 kA8QnFc5bxrm+1xC7IM9FA+bwPWFV2LjkZDWgdEaJCwCCX5SYNbf8FhOXH0mjvq6hh71g1ol/Q7
 IvFWK0/B6LZ0DfCGFB/VrVYhplzIYlL02bfJyz4ILbrfzbMDX8M92snDidmUSwhkGfLjY11EO4t
 QhB6qt91tCW4tJNTPzq+fn8D1TQ8oJ01Thr8PfvXLkMWM9ChuUEgyyU58PNqjvdNk7kNioh0ZJi
 j5ryOP6/BdtKShdOu+w==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c2faf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eCx_7nzpRrifSLxMv2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 3e5xEwD4tTdRPGlmzOfiE7mTstAZDIjU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfXw32K6JW66J8K
 fzyxZAwMPF1xTebdqdA/0josvXshcxcH7HyZR+907mS3XZBarEZnPCIjpuncaz2AjKqWz9pKtrW
 vnyUYPuORswhlR2Q9gfTVQluahAeqzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120067

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
> even if no vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Acked-by: Marc Zyngier <maz@kernel.org>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
