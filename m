Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409A4FB9A5
	for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842252; cv=none; b=NoCGRRdTeeVYBPmREtsqWRqc5DGiAe5Kbr66uDmGj/MAG61Y2gxFz343OdjN3fAWRU8PWW5i3Q/Ayf4y9gr7wl0ymcDGVx1L+Sn/r2DjNqxwRsBrvXQI1I4Qs2ofNuEObg54DOoYTHZHAxgtu3cOOGX0CjS7ZdLw7N4Qvk3RvHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842252; c=relaxed/simple;
	bh=P6jfC0A0EmG/xyfQcbws1efUz2wOkhVgwoKrGtJHlrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0eYEsCdAtlc20wh68+dlOaSq/KaNeIHxikYoKOcyjCjVF6ljh2R5KKOzKBzxz+fWCdJaiJQv5LW/4EJ+0kzO5+wJZW5ERlXYr5DI6ztmKEGdUNcpahZE25B/kas3Ce+ore0Ht9C8hCPTwnJCsCvc3fwDP8AZTRtlAbMlkRV2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obR9ibNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A584l8W1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obR9ibNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A584l8W1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJNVNn3259417
	for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 21:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GrCqiMFgsWuCjxp/MP+SWZYLaDIyfVl/iFjpkLpo+U=; b=obR9ibNyB7rgLaoF
	z62XLJbC4hYkUvwqdYBGhigKWvYaC3RH7SfggKa/mhO1WR8ruWHX9p/UrdNE6gmb
	k+xC6Yf8Lx2KCMQAZQFggHsx7fE+0SWtZLGg3MBO0K6g5Yt5PBdoh8u4Mb6RzMxX
	jxggXFZkmdpcJZ37AEIFhOJwPR0hW1xQE3X7ovKkfnp7jIaRO7VlPpYLx0pCwaXe
	c9Wr3R3S1Vrgup8sUxj2irHlKBxUXAnb8lZLnInekWjn6H9DcFLmJWKNiStb+MIN
	b1DPzWFBLtYMpwyRZP83VD7U+TP5lyqcfMc+k/e24JDQIhm2xrpBn1y6d68EIu7i
	K8lulA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq3kvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 21:57:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso465423585a.3
        for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 14:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791842247; x=1792447047; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GrCqiMFgsWuCjxp/MP+SWZYLaDIyfVl/iFjpkLpo+U=;
        b=A584l8W1+bpDQ55zpMOVhg30DZYy2BxzV3Ycmfpa/7fiNqycmvy7zU87tHdKlhTnfS
         0Q59KJ4z1Z4IdjF+o0kDtbGSHVA9aIXcgjieKwSAeBNYeKF7hFSj7F3VRlaZmvMo0Q46
         KlqmnVQi1iWiDudItRs6b2ltOpUU8bmMiHySX3tXRlnXAFlBe96aCv70MNnnMEx/qmWc
         mvWonJRb/10HvRLi2ZpREA8WyjsFeZo3pgf28PdiqLZpdfF4AlD3Aj3mskFKXCyl4cAy
         dVVhinWe1duo4YaFQ5O+WSLjtYP7ML2HbT00LFmhuju1Tn2MWex8/jt3pbrEtSLWjsrp
         gPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842247; x=1792447047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GrCqiMFgsWuCjxp/MP+SWZYLaDIyfVl/iFjpkLpo+U=;
        b=tZx/fqcfLa1V23Ci39Ifl5uvTlJ9k/dGNW7xoue8cz/mpI3QkJMvgG5f0GNTzT0xF4
         S5zfPByVcTlTpm7WCMxUUR9n9dxB9E7FOW4pnbAraq+YB/cHI1tDRbUcN7F46KSxXX38
         hrigPPfxi7Lsfxxc1Kd+e6dhTRIpNLT1Lxxg+388lgxfewFnxBA1BtvXXuCaeGQz6ghC
         EZa05zCIbrsLgwztc+DH2i6VJOvCqC9+w7CGxXLsOe2p5IGqFJP1Wzr5yCTcQE/tiszU
         NSIluzqBpej4+THPHCtL7jrfG9XLpn3Q7EnWCtq119dcVUjmbsiO6usUD7DCXf6eWnDB
         ITWw==
X-Forwarded-Encrypted: i=1; AKwUvBx/R/62ejlV96nYIHUiuhhaFD5IDeXagcEP0nJErR/FmDEGkT7BLt5TM09GTy/jIXLyTK8FRHBcwVc=@lists.linux.dev
X-Gm-Message-State: AFq9FYIInDqeSdADHLm6HEXEfarU9B3z2nlp2st3Vt04jCeiRQE/jOl9
	BkalrpPM84hTfkMc1DRIWOpdHPhEZfUGS79Cve0KKj25+SfgK+nGCktfIBKh4WPWZFGHJNRtg5Z
	5/AHeDrtLwQR2EPTh+CDaIa2OuTtc1/Bk6vlO5afJQsbUorjudIP8cmLYdDGdDf0=
X-Gm-Gg: AYBFou2pub3hRnr3W9XrG+5BnM/8Vl/MTGN9/ZcchJPwJHAtoOA+esKWcqpXTt6Rb8I
	HxTyjWNqB5Sxp+pL48xkmODeE4riBK2suZVo5+gNiPROx50g1iXOG75IKO8vruk6gW2LY/ZvIJx
	qyPo4IEpMLSybbKj7RElczFV/sl3z+P+hQAon7u5Z5oN+8jPpXdb+3qBhTqbHPWUj5265hMQuOe
	7dQJ/oOjTITgmVoX7wpD8D5kYXC8L1p3BtMXxzSyoPNhPgK8EWHgpR/nSxxZq2U0pnja0aAjku9
	MKwT/R5co2aUULmGXLSnVaiAcELn4rgAEFdb762aT+iJpAtZQpfEYNkDYHaHUmjWkI0ckD26MeF
	XHBJGr7HOi5Bs39J5e9jblSOuQIi+d98xWOh1aiE9X6EK94jPgZ4EUi52ss59ig==
X-Received: by 2002:a05:620a:4149:b0:93e:d051:8f19 with SMTP id af79cd13be357-93ed051b7e3mr1187563085a.40.1791842246763;
        Mon, 12 Oct 2026 14:57:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:93e:d051:8f19 with SMTP id af79cd13be357-93ed051b7e3mr1187559685a.40.1791842246244;
        Mon, 12 Oct 2026 14:57:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm490389045e9.8.2026.10.12.14.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:57:25 -0700 (PDT)
Message-ID: <66a8df16-01c5-4653-9fb5-7d746f03f782@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:57:23 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] thermal/drivers/loongson2: Fix negative
 temperature conversion in set_trips
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
        linux-pm@vger.kernel.org, stable@vger.kernel.org
References: <cover.1791512067.git.zhoubinbin@loongson.cn>
 <38f8e7cde8e454e7c6b72cb1b9a1c54e67c8a7fa.1791512067.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <38f8e7cde8e454e7c6b72cb1b9a1c54e67c8a7fa.1791512067.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acd57c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=i-ReG1_fGx0deHkufOwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfX8m3D15wNDP2W
 Zs0gXS+KpW5L+Q3hOjFIkWTKlVTypsQpCW6DN5Hcen3LQjWCEWp+I/2QECGaxNZeGm5ULBZA3X6
 NcMmn15SkdEj7V5BwmuY+CwtAsktsS4=
X-Proofpoint-GUID: R4-HzTPRSMRGP3rUQHhj6SDmt-i1eQA7
X-Proofpoint-ORIG-GUID: R4-HzTPRSMRGP3rUQHhj6SDmt-i1eQA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfX9RkvnjxcMMDr
 Rm5tdfJU2kHpZ2NsQzjR+ZRW17wcve/XibPKfC0m58oqmf5bsSwU8VPCbNRP8kTTKmZhwSyJygQ
 3BamoPhi7PVjutt6QRwC3symcl4zHGymupZIxWWNx7o4NAqGkRoQmCb/xL171j3MoapvUEkvxaJ
 6lY4OduIbAkO8YLHkkTl+g9otVakZwJzV0JlnWUK08Zq7i/FYwbecLUA+7AnpE0Kx9snO/LQruB
 xRwPN/2Gb6Xam9H872KtIT91cgtRIejiQGU4EB2/ECdpaFn+41AMblCESeXvFqV3917SWNwB30+
 WjF1Omh9k8/GyYasy+c/EyRtjuvRXTrA/SQOXBxIlsqABhy76vRJWxC2/kZ44G5C5OufJbu0IsD
 vwpkK5EuCQ6OVA59p+LAChg3Z1FYqevRnSyvOs6ElAPvA97YGo+K4AbsC6GvOCRj+tsF5zUfhaO
 lY4dejpBHZhItHLG4vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120087

On 10/9/26 04:57, Binbin Zhou wrote:
> The `MILLI` is defined as an unsigned long constant. When the
> temperatures passed to loongson2_thermal_set_trips() are negative, the
> expression `low / MILLI` triggers implicit conversion of the signed
> operand to unsigned long, and the division is then carried out in
> unsigned arithmetic.
> 
> For example, with a low trip of -40000 (milli-degree Celsius):
> 
>      -40000 / 1000UL = 18446744073709511   /* unsigned long */
> 
> After truncation to the 32-bit register field this becomes
> 1271310379, instead of the expected 60 (i.e. -40 + HECTO). Writing such
> bogus value into the trip register leaves most of the upper bits set,
> which may hit status/trigger bits and cause spurious thermal interrupts.
> 
> Fix this by explicitly casting MILLI to int so that the division is
> performed in signed arithmetic.
> 
> Cc: stable@vger.kernel.org
> Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal management support")
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/thermal/loongson2_thermal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
> index 4d40fc706a53..f5ff0cac1442 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
> @@ -108,7 +108,7 @@ static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low,
>   {
>   	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
>   
> -	return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
> +	return loongson2_thermal_set(data, low / (int)MILLI, high / (int)MILLI, true);

What about using MILLIDEGREE_PER_DEGREE ?

>   }
>   
>   static const struct thermal_zone_device_ops loongson2_2k1000_of_thermal_ops = {

