Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798111;
	b=ZNq0ivxH4Xzu6Efqs6yq0Msyt4+RtM+P0MoWbhd3YQleM3M/FcmhNtF8Dir3DanWPo8i
	 fJDPy/aadGr7iRHM3ZGMwnhR5Kh3eBRngvtRQaej78CP2weEDdJp2g+MnRsByn/QM+Vte
	 +8tJk+SOwur7hwhUcl4oPNifkkU3n/gQDIru72WqXaczQTplExwkgx6jz1UmMjeO9Smqq
	 kbb4mL1UKwUmQYxaZEyymjwXWBLS/C1AAeIQ6bTxur2dw2fElaJ0miILMdSJvS4WC+J2g
	 LweEANYgRmI8jnvrUnRxITlaKH8VpYv9UK+Rk4LUEgT06wsHpC5upsGM8xAqe88wY3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xh9EOmcuI9wyEV/Jmo9i6NtzTlnDgJymp46o7FRpHF8=;
	b=l5opozFrXkvMcFWKbWlPE6Njbx3IMRxh1jembrHl8p690ylXqFmt84UuAroTTDVFOBpI
	 BLB2YwBFtuZph1h/f5RxUhkG/0I8KgdB8FMap7UbPY/yxwHuWfit2JEFXeQWjqaLVu/6Z
	 49yHsqXBdwUCaNr/UZ9gVHyQc34ff/Q5+eakKv/YMcgw596ujRJV2wMvDnf+e+PtoRxdC
	 hO6GHJkSDAxwOV0brVwRMTAwmC11sWW5V4W50VCGqgtI209NGOlM9inqTaD2GlvK39/JF
	 w/6D+S8AU8HO3GVzgh2KdHRD4t3x/o1WCzMlrgcjpbPayI7gzVi/NevoSztIdxJhdbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cNnOeYV5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jBfblJYS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8CB606A32D
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 13:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F8CB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cNnOeYV5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jBfblJYS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZvUb739262
	for <loongarch@lists.linux.dev>; Wed, 4 Nov 2026 13:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xh9EOmcuI9wyEV/Jmo9i6NtzTlnDgJymp46o7FRpHF8=; b=cNnOeYV5Qx+nStdG
	2Ty3Uxe5LC7IKPsYJsO+ryjcl1DMmkJGy2p2um6SfkUYaneSsxr05OTL9Eq8lamG
	MqJQEFjAreX3XliKerA373JHZSxtSnxFvRmR3iDzEG7xRNwND7+lGWvDFJFdo4Aq
	lRUrd7grcvT7R7JHB3P/kur93Qt+MxBue+N/dtrGY5ovuj57Pd8u9YBPuAIO4r0G
	rys9n+k7BKZ9I61CDD0nfbvOEpNeBxBagKuSFmJbqkLjyz1WVbPgWz/mLOgGO2L1
	Ik/HYXhhwAYbOUAC/mk1gYfJcbVH1HyJlNrYmXwLK/gFdDe2VLiYaeC4FSjSM6zG
	GPSuYQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163h4up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 13:15:09 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6dfe0f03baeso773149eaf.1
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 05:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798109; x=1794402909; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xh9EOmcuI9wyEV/Jmo9i6NtzTlnDgJymp46o7FRpHF8=;
        b=jBfblJYS7V87LcW7vyJ1PrID8+lgJCWP33gpeQDd6nCCNIG26yEigmObyy/OxWdxM4
         pqUKRDT9s1eZYAfy/rBvvWq66RffjItcb33ml/CF8HlIpYTott1+0grzeMKIJZgiAf28
         hsK68mQ4seUVBDLjXkvD2ptVyhiVsgqWkXnLAP9f3paItDblkeGjM04KmWQ9BjKLF/Bf
         nXqBymEDU11nGQ3WTcvjDSZjI/lsj1+qbvh+DBbMs3EFJW6RpNc0n9eY+DgT9f0cjN4K
         I4Dp5tv43cq1wXFIxxeztsURyubnEkAiRoHWlmAkxetgxbsIuWCOiW6TWltLDlJHWpuB
         DbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798109; x=1794402909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xh9EOmcuI9wyEV/Jmo9i6NtzTlnDgJymp46o7FRpHF8=;
        b=m4RTfaZgeQ60a3cyWD1fe/6MhdpRA4hW7OUNpDRV4HIDJhSIJRnKTsTGv1700p/2EB
         6KyZk0kqaFB/dPO8FbwgYo5izerOZRQbN2aKMvej1y78wQPkF68irxGm5rEQs2BcIjfB
         viJIruj6OoGNYRj8kd4cbUOnp5gdwlO/iCKLUJgWCXQrj47FKwWgcLYUlzAir5UxUbYr
         /5ouDhC0dfD3pLr6LU70MK2gnBbx+luiHW6Deki35963vZMw9400y0ASc2nseyA2unOx
         QHbHokYJNzSMAGjxinrFbTg0IC9v/HR/We4HBSed0aGOAEcAZRUGg1b6leCLkGLdu5lj
         21+A==
X-Forwarded-Encrypted: i=1; AKwUvBz7GJWQNq9Wz5tRCdb935xtu+BvqRDk7E3pUeBCBj3Oo5haKteoZb/zf6f62KCnlZu+fGCF3UO5p0w=@lists.linux.dev
X-Gm-Message-State: APuU4Z+fLiOGWo21nUC9yz5CJrRQFm6BfAcVUsGQx8veWmmMSqKz6LsJ
	o5n43cd4vg3Ix464O/2IHXK7ZRHKemQGP7dHd64DaA8ZY5V2kzGxhsNwFXdeyeIHRhS3uqPSM4c
	67u5R+3nXlM8O8oJwcik0avsHKeAodv/uMvCrOoNgqbU4PlfaEoAsXJ+93pH9BFo=
X-Gm-Gg: AYBFou1lyyEEeF7maC5+At/2eg0V2cZHNeOc4DlimfJvzCB7lZik2r41URkqwo2AW0L
	jTQy1Pv3jNAVGZeQGzjjO78oiEsHSwj8G1eC8DvmjTuG9d4PfAOaVk/rAPMmbIyX5tgtF5HdgpA
	giTCkT8SnoOv20cryjqjrVDnUqq1gRIfFcRaSmXH82eElZZpAu4uHrEkYuVntXcsFfxcryKsgq9
	O+gR/H+oALNhrsT0sLHvOYcz/5j2xaIgLE1qINMIQizkOa2p9ZcpkECRD9l9oOftGv+QkzGH+sI
	a1GlfLvRswZTtvn1I56K1spKRDDqWR2jplmvqupVtVVHe8m5ybMyzDZmOJuTwqRrg6c5t6kgPfR
	UK+dSPQx7yp8FtBWApvCb8iU/ZGIeHl1ROeCn8AhT2QvyPAWQV6Vj6/7R+0CBqF3jrp8=
X-Received: by 2002:a05:6820:1504:b0:6d9:8fed:b732 with SMTP id 006d021491bc7-714f29d7767mr8519152eaf.56.1793798108844;
        Wed, 04 Nov 2026 05:15:08 -0800 (PST)
X-Received: by 2002:a05:6820:1504:b0:6d9:8fed:b732 with SMTP id 006d021491bc7-714f29d7767mr8519124eaf.56.1793798108043;
        Wed, 04 Nov 2026 05:15:08 -0800 (PST)
Received: from [172.20.4.37] ([192.210.17.203])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm1583094eaf.13.2026.11.04.05.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:15:07 -0800 (PST)
Message-ID: <d0a13ee7-c3b7-486c-b3a2-6c4fc06694ac@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:15:04 +0100
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] thermal/drivers/loongson2: Fix trip programming
 and add Loongson-2K0300 support
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
References: <cover.1793690276.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <cover.1793690276.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3F6FGR6NjInO1NpMpNTErrUw0mJeJjon
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MiBTYWx0ZWRfX3UT5cufT9hTH
 1wQPhvWP42x/v5hEc1ynyq92RKkAFX2fvD+GoGpZ5KWim7SeUGrg5Hqq+yJxyHNnwbziEok0Vki
 LHo60I0eeg9lnBfr6mByWA0hmqsKtCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MiBTYWx0ZWRfXwzchRvQiQVp8
 tSDcMImI1oD0lgAYp09m5RTiFC5lGHJZAayiO64lmsf4CM78BC/HlokhxQayu8W8Q6JNwfwVJdh
 X+QlYOI5RhV2vo3xJneplfoBGy0B6UkPWEv8hQenYmywcEOIBGegRs1WPDR0Sfwn/bWKXwAPsHl
 fIMBo9WnVCD/qjl9MElyAKgqZtpgFuMlhhavUQuZ1gF7tZSfHR1c4ZGyan1HRpH4nJ1HZsLCbfF
 StgO8BYMFxf8O1dtxVnY2p0zaYUzcrNxXRM8Bb4grx2xNeWqIhdH8UqaX3xf0MQI6FCGAW0VMcw
 1UsuCG5s7mLJfq0tE7/YQNxen+HKgKaa+bOSRCdlfxz4soZ+HdVsVzFYERzobeL3BwbdlFc51Y+
 yHEM8gIW8KFTZtabKd8+9wnSDB1M7oD0j2cFQFCyw8UBtJuJGnlHhfyV/pEtgO1CxG40ehVKB7w
 QJsYLb9/eaydJNm4ZaQ==
X-Proofpoint-GUID: 3F6FGR6NjInO1NpMpNTErrUw0mJeJjon
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb2fdd cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=3CSVYe8HblTQFsWiJzwA3g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=PsDKY8HSHSVfbGAcyQIA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040052


This series still has report from sashiko

https://sashiko.dev/#/patchset/cover.1793690276.git.zhoubinbin%40loongson.cn

On 11/3/26 08:23, Binbin Zhou wrote:
> Hi all:
> 
> This series fixes trip-point handling in the Loongson-2 thermal driver,
> refactors the driver around per-SoC chip data, and adds support for the
> Loongson-2K0300 thermal sensor.
> 
> The first three patches are fixes and are marked for stable:
> 
> - Patch 1 fixes signed division when converting negative milli-degree
>    trip points to degrees Celsius.
> - Patch 2 fixes the arguments to clamp() so trip points are limited to
>    the supported sensor range.
> - Patch 3 fixes Loongson-2K2000 trip-point programming by adding a
>    per-SoC register callback and handling the split HI_GATE register.
> 
> Patches 4-5 are cleanups and preparation work:
> 
> - Patch 4 removes the unnecessary multi-sensor registration loop.
> - Patch 5 moves the per-SoC ops and hardware initialization into chip
>    data.
> 
> Patch 6 adds the Loongson-2K0300 DT binding, and patch 7 adds driver
> support for the Loongson-2K0300 thermal sensor.
> 
> The patchset have been validated on the Loongson-2K series development
> boards.
> 
> Thanks.
> Binbin
> 
> =========
> V8:
> Patch (1/7):
>   - Use MILLIDEGREE_PER_DEGREE macro instead of explicitly casting MILLI;
> 
> - Split patch-4 into two parts: the bitfields section will be merged into
>    patch-3, and the remaining changes will be merged into patch-6 as
>    preparation for introducing the new SoC.
> 
> Link to V7:
> https://lore.kernel.org/all/cover.1791512067.git.zhoubinbin@loongson.cn/
> 
> V7:
> Patch (1/8):
>   - New patch;
>   - Fix negative temperature conversion in set_trips;
> Patch (3/8):
>   - Use writew()/writeb() in loongson2_2k2000_set_trips_regs;
> Patch (4/8):
>   - Rewite the thermal sensor registration loop to clearer;
> Patch (5/8):
>   - Fix `loognson2_thermal_set_trips` typo;
> Patch (8/8):
>   - Read CHIP_ID1 only when EXTERN_ID is set;
>   - Simplify the Internal ID calculation;
>   - Add the necessary comments.
> 
> Link to V6:
> https://lore.kernel.org/all/cover.1790561983.git.zhoubinbin@loongson.cn/
> 
> V6:
>   - Rebase on linux-pm/thermal;
> Patch (2/7):
>   - New patch;
>   - Fix incorrect clamp() argument order for thermal trip points;
> Patch (3/7):
>   - New patch;
>   - Fix Loongson-2K2000 trip point programming by adding a per-SoC
>     set_trips_regs callback and handling the split HI_GATE registers;
> Patch (4/7):
>   - New patch;
>   - cleanup: use GENMASK/FIELD_* helpers, add named constants, and factor
>     common trip point setup;
> Patch (5/7):
>   - New patch;
>   - refactor: move thermal_zone_device_ops into chip_data and replace the
>     Loongson-2K2000 flag special case with an optional init_extend_resource
>     callback;
> Patch (7/7):
>   - Updated the 10-bit output to 11-bit in commit message;
>   - Temporarily remove the implementation of `set_trips`;
>   - Remove unnecessary header files;
>   - Rewrite `get_temp`, separating `read_calib` and `detect_old_fuse` into
>     new functions to be called during the probe;
>   - Use macros to define the relevant numbers.
> 
> Link to V5:
> https://lore.kernel.org/all/cover.1789546118.git.zhoubinbin@loongson.cn/#t
> 
> V5:
>   - Rebase on linux-pm/thermal;
>   - Drop patch-3 for it was applied.
> 
> Link to V4:
> https://lore.kernel.org/all/cover.1785829933.git.zhoubinbin@loongson.cn/
> 
> V4:
>   - Rebase on linux-mfd/for-mfd-next;
> Patch (3/5):
>   - Remove the operation that adds `compatible` to the `select` node.
> 
> Link to V3:
> https://lore.kernel.org/all/cover.1785480242.git.zhoubinbin@loongson.cn/
> 
> V3:
> Patch (2/5):
>   - New patch for moving thermal_ops to chip_data;
> Patch (3/5):
>   - Correct spelling errors;
> Patch (4/5):
>   - Add Acked-by from Conor, thanks;
> Patch (5/5):
>   - Keep loongson2_thermal_data->chip_data as const, and use
>     data->flags as the private data.
>   - Renmae LOONGSON2_THSENS_OUT_10B_MASK ->
>     LOONGSON2_THSENS_OUT_11B_MASK;
> 
> Link to V2:
> https://lore.kernel.org/all/cover.1784619512.git.zhoubinbin@loongson.cn/
> 
> V2:
> Patch (1/4):
>   - New patch form Sashiko;
> Patch (2/4):
>   - New patch for adding chipid syscon compatible;
> Patch (3/4):
>   - Use `loongson,chipid` phandle replace reg property;
> Patch (3/4):
>   - Refact `calib_offset` calculate routing;
>   - Add LS2K0300_OLD_FUSE_FLAG flag.
> 
> Link to V1:
> https://lore.kernel.org/all/cover.1783670011.git.zhoubinbin@loongson.cn/
> 
> Binbin Zhou (7):
>    thermal/drivers/loongson2: Fix negative trip conversion in set_trips
>    thermal/drivers/loongson2: Fix clamp() usage for thermal trip points
>    thermal/drivers/loongson2: Fix Loongson-2K2000 trip point programming
>    thermal/drivers/loongson2: Simplify thermal sensor registration
>    thermal/drivers/loongson2: Move per-SoC ops and init into chip data
>    dt-bindings: thermal: loongson,ls2k-thermal: Add compatible for
>      Loongson-2K0300
>    thermal/drivers/loongson2: Add Loongson-2K0300 support
> 
>   .../thermal/loongson,ls2k-thermal.yaml        |  73 +++-
>   drivers/thermal/loongson2_thermal.c           | 359 ++++++++++++++----
>   2 files changed, 332 insertions(+), 100 deletions(-)
> 
> 
> base-commit: 4358090906b01806ee483229e8d7163b806bd116

