Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C53E7647
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523539; cv=none; b=g1j/PcX8e8dd4MWRtMFS3XvE6JGvajtNpJhggZXNlCERjlG46/W56Xmkke7aQ7MEi6rOqmlGp0iRtVFQFYSk1CvynejrcJ6tMYbi7+EuWhxqOqCGqDHqV+SxC1sBAbJ9eq7IbQ+LIRfwnlCRXNeGl4svThREPI/E52JCh6/6DAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523539; c=relaxed/simple;
	bh=A3S1d4xkoEt+tF6cKjXmjHZ/NIiDjyfZkhSRsMbL/Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNw6cIYM3zzb0EAQgbhGowTA5sucAvGeoCepQ+l0yUhquu22Xp+HrgGGRw5b08m5yL13pP0rVN+duw5NQiv5g9Br59Y5wZHIlzU52FOM/QTLkhWtjWG2n0nXoTRofXPJzl0s3FeHXmUqXaW7s8vNu6yrR9jVSXi/CutFqU0PFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8C9Yqg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gvmqnd3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8C9Yqg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gvmqnd3d"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C79S5R3144260
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=; b=b8C9Yqg8Zv7ud594
	nLhBjn3LD0R2IFoZBphwr8fNk+G3TqgTAuGQRrLfP3UKNc+w9ecbVuIvfdwhgDUx
	MskA2v+orWOZkzQQc5qbsAoL2X/1Ibgu17Rsz0bi7WmtOCjmGpoHHovoyRSvSfgt
	jTafQSFR/yRRt4vo9apKANAlKhmbFAiqH887KCdB6o9SoZf546OmI7m6fYiyPZ7a
	WFCs785nwPsjy22clIkMH1I7BhQxrJiWr554cT8F+65SPndBCqt7Pm1r4Vwg1hhN
	7Ok9ydvCxHueLfYe96jQOcXPNTpqbrv4HLjZXsYIp38gQ6bCWQ2W0o9Ba55y0NMc
	SmZw1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0m6rg9yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 08:32:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d28f8737eso14004951cf.2
        for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523536; x=1787128336; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=Gvmqnd3dqXwJw8E8TAy0Xe0+uXJXuRSvzrKgIyAoVbRxnsLzOeEIL4Oy1aYCSy0bSy
         lXtlxbPfFgCCTXLbQJ2/nmbEGrzrSxY6tgUffgEFlOdmbJOEg+PuABPP8IP39B/keoKD
         fSWsoDg95iA7nDZ75X7oNAvIQEWB5tnS8q4oXAGtuQCUppH/1Uo7BxmfRgCRRVC9LEIO
         V+Hmj+mkleFGv6LqOnAAgS+KWLg7S6CDFW/c0UWG7lb5kWC932mU0y3qxCcoEdsH2DtY
         Ul+lITPhY0e1NuCYiac5uNH4JmiE7cT0ntcCnIhba9gvcVzQicWdylpNTJbxvvrS91tD
         fcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523536; x=1787128336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=CGx+eNxKiDZgY0/Z0Qd2t7WBgNKcUjWgIlU4uF8bB637XySYi3LeOkSVI5Wx7w25ZY
         G92v7Nx8ZHwPFcn+MMXu+qYjZVtMwCD14t19CHpg7jrIZg1VhblE/0x4tTpE8xeN32FT
         xVp4bEJFc3nDgPaTL0Q50BlW94jBe6evoymyRD5Ufxjeli3d0ISY2rGeTuyGd10bKtsV
         82UINXSBLfZ4h+OyJyr87xRmoGNotKupPH0PhFC6Cgrx02YHKVZbxnBN56OMDA3q2oy+
         7haTTJpIs6alOE1J6ZRADyL1xS7XRaoKZzNr9dQ9WLtBvHPs+Dm+5bxC3EjjTx9rMCbn
         qHBw==
X-Forwarded-Encrypted: i=1; AHgh+RqpdB2/8T+Lzgw8ZAa8w+QN0guFy7XEV0uGkm8OgkVTmPzXmrcUuoqtvEf8tTZwcdSZGLK5PpqbWyc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAAZhhcMXGPp8ZHJeEKfGWCkHilDZEy/POVfrO9Tn4LtbMQWgg
	X4PNk16qTruHQFvkep99Y75F55/i1++IZa84h7nCdBQ0SzrFLJaoMchQ2Ane1z9v3cIA51mzkua
	PEkGRGGWrakZSMYSch23WRI5ePHIHly/3A3+lBubkMRR36woHMo0JPJW9D1a0T/Y=
X-Gm-Gg: AR+sD132Mye0NdigGbINWZhzP0WKcB1w+/222hhxWMizqo1GBQvgfi9CHrIZpU/0EHl
	hYeK87r1lyKLL42cBE+pbkQsS63U/f0bPxblzT8tdn0Fvh6JN03jP5X6vPSVdyi2f5cMg++t+hR
	pyRgcvkBo2WvLCHA2J7EZF3I8zIru4mTSHQh+U8NEUaHXy/fCV20VJXB4UQz0h1A1sDeYPrvCYv
	Ii8xpOKaDiSS/ZKnY9AeKAtBO6eZ7LbnkNCs4RgUKaXquWwRG5be6MTPLX/M6O1MyArSjEutVJf
	KeYGTcxH0AB591vabM2OhCmLSTSiH+4ISm3hVNrhtSfZt5ep+lZ6Gu+HY9lEF9dmCDYSvUZhH9U
	8HtoOZoiKajpHPWoLAykY+FzTWfH+OD4CUV8VrH5Iw2Ms2+kres6HMpxGdqNIHAw=
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847461cf.33.1786523536343;
        Wed, 12 Aug 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847101cf.33.1786523535827;
        Wed, 12 Aug 2026 01:32:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997d2e4ce5sm9693755e9.0.2026.08.12.01.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:32:14 -0700 (PDT)
Message-ID: <c70e9011-26e5-46b6-aa1f-c7f0c179611c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:32:11 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] clocksource/drivers/mips-gic-timer: Remove
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
 <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX0A6P25hIcsnc
 5dfDof5UkGscBxPLFqZpXpmGo/DZym20JOt96eASBPx7NSEQzqF3SY+3OYj1TnldvzksJejRXP3
 l8YxVBIpi50OqpySujlGEjkcquI3sdi1PANMwSXrZfy7QPlbObY5jmOvFrHJb5WwZoC5UjvKr01
 +tNc2zdThAuf658FnrOqqsngPfrbNn181rJ69GxZn+GE/JIGhg62ffGssE1DOaUsfAIkSUbIE4g
 830CNx2T3VLqT/zslayDheFlSPzjqFxpvIb56JCAvh0ViV516ViPWmirfaS3BQMz20CO56B/qQ6
 MaL1+82JkBoJQbeLRRlqsmNtOjwWhlQl6oojW/4/GSHUY2pwLjXzYsonhSRBIAN0wWzIyDf+74p
 0yIOH+abB+2wLN+Ks2Mk190ofblSA329c1zfVrpg0F5yrdNtNUyxq5GR2Assn/xyxZ0J8vzg2kQ
 SR9YRt/O5kBwZhNzTnQ==
X-Authority-Analysis: v=2.4 cv=Wb08rUhX c=1 sm=1 tr=0 ts=6a7c2f91 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=dVVT6RvzqqZ4HvZtmZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mMbrXC2gLE4yaA8gFXDsobsPaK3YzBRI
X-Proofpoint-ORIG-GUID: mMbrXC2gLE4yaA8gFXDsobsPaK3YzBRI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX8kaaxIfNJwLe
 CA/PhvLv4PSDRyvnkAzH0PYacFO+qmW7N7xKu6r2i96oU49F3zHTqilQ77BiFD/ss8aB/IFHSoq
 wwNQcGRkesLapKDos/RVq0BpTRFnMkM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_GIC even if no
> vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

