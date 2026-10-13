Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3AD3905F0
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881330; cv=none; b=fULBp0MGZuaQruvTq/dm8uGBgMWBAUCJBzGvee+703ojjH9iXKew1Whxtg4EEuUbJBg2mTSSDmZcw3LSE/yC8jE0DrYVKY7c560Zn01bBPf8xMG3fDDSRD492CnSbopFZFnX87acEbYuMv9+8NJBp5ThYEFWEdUcq7saZiv/GbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881330; c=relaxed/simple;
	bh=YtQ34cQ9XmFi6zcNdYGMdmbtWTCoLVnZxtAsP94R6sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqcSDiozj8jDA4V4jwq49fZIWm+8n52c1dgzxGCwY1iif+0BbnJ5h3CG8wUTv3j9E2HjS/Sx4UGl706jU/DxKM2VKydoBTyJaZozUR9XG9RjduJ0LCLmEBar5ApHfA9ybtj/NpLvLgG1Ze30C7iH0WX52m6qSsPbLvoK6eaif8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2VWao6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxiPO3zj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2VWao6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxiPO3zj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Z5hB989732
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 08:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjxJi1akmR350BjqJjUpsg/JBkPEFxqTxpfhmQt0rP0=; b=K2VWao6AEPk4LMGn
	35Waa8iTcpOgbuYSmwTYe0FtW4M05O9CZjHTZDPpEvsNL+bMOWWfzPJf0pANq9Yg
	/SAzOHHOVcaQN7m3yIXKvms+ZydoW4SCvGfsblVH8cNoatZHKQaQFitxH4H2/O/k
	3duo9w7IfJu9Ad7Seh+0cgCLOSKXblbsQAHauG+ZcHTb2STCDzZ1CsDXoVMxUue4
	V02ncNdLbvWJW2iWtN0zayH6BvIrB9MsRXd4Sn7vwodCszH2V0VdeA/Zn6FhFZlw
	Kn86a9PB6mL2HKCtwYMLjyaF0avKCyYfOszNTJvw613zbP+nlycrEhyvCvk0hp3Y
	9U2eKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hca0tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 08:48:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so570759485a.1
        for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881328; x=1792486128; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjxJi1akmR350BjqJjUpsg/JBkPEFxqTxpfhmQt0rP0=;
        b=LxiPO3zjGPDSjLSIGF6Cjs6nhn9jniPq4d6pIXYHz3QHjudD7OGkIo5DAhvSxXwFEv
         JZ3US4ouKdsDLlk42kw13E2LCea6RWdwYP3tMVYk+/OWQVKZQhSA2fF770vZ9AFJylQU
         rNNmXRShRkhr6DxqtjfBbPoXmkwFFP35tqwcnWD9xN6eNYxXgussUPAsL4DY6Y8+CI9O
         qRmGjFu/mJZ5Ij0OsanFyOFoenVNlpZXIJ0GoouJBYzKVG+NDL2Qw9HfZvFq28kerNGW
         tTmMFiRunIE5VE+p6wCUyG0vfVLs5CvOjxsQ1Zw4LsCMukD48OqkN2YPQHJ6bJaeYndQ
         grdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881328; x=1792486128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjxJi1akmR350BjqJjUpsg/JBkPEFxqTxpfhmQt0rP0=;
        b=Yip025MSu2K6TH7P9kS6R8x/96pTCsL5KVzKHt48ts502AlRCV3Nb3sGYt8DErxU/O
         HhKagq+Gh5ILqpd/dc+5plZBMEL+AAKhR3pEG+Tu14DymanZzjQIE//jqcg1ZkR1GIXh
         dyDN2aKx6cnkiNG7IeDwKvAmqhCmSP6/EhYdYZadY3zfrhKl+Vzv9QGN9FmQKafxtnBK
         qdS3adzG3kTco9UgVwdiiBjxIN7TLEl76cHLT+dD7KOixJFnrGpB7RikOQqfI1xU88qc
         d7BmowzvGOwY8BCamM441L0LKbYOBmryCBMVf1jOjdSS5kyDEUSRSJsVCu+1qw4/U5Kn
         JY/w==
X-Forwarded-Encrypted: i=1; AKwUvBxKLMgH0q/brq27fKKeUAJRiI9QRW05gelAIUE8/sxYV3sHeeXkPMDdMT9duu3CE5IniVz+BOlN0qM=@lists.linux.dev
X-Gm-Message-State: AFq9FYK7tP7Dl5YAizuf1trVzI0oxxiY6qE25GRbSQ9/1shIZv7pIBxm
	edgiIhD4f0GOtOc8BJ8OIrZVjURUAs8J6iGq7n1UDEwT1jNVjYK8t6uAWMs8ya1ZadQ7CxlbOgE
	WnfFR0YHEolLt0xqdtlzHtlD/17Kf42Ajp1wfnzl5JCfh8ZzvWo2REu735ABg+Tw=
X-Gm-Gg: AYBFou0D7gXC2RNeW6+4bWBlMfuHTm6cuhFHqQ02rfC/ods+/8zBhUJ2uyyWIsi2zb8
	S2Wa/ttFtLogYK9MW81Arfs79gRzP2td367TaYrogIyUt5erUa4NU84ZYaJW2AXAqDSrj/MwX2x
	LR6dmH5qTso1pgVzbTlq804MxXHPk5tBSuaJr+byXHQ0eF2Vkl2XYa4/NZsGOb6wk75iWyntuV4
	tQPO1lz793L0vYbPjzeyYyrEs96mrVSUUW+QOm+VMCr3LqaRaFOmM/UDy0qZnahMc6SNUlyDRAu
	LFxGUM57uzQqOgWjJyCpg6xvMd4+zE+OpScHm+zqIwZ1uWPhyJhDfu6dBvR2qYZzSFSz9bk9OLF
	YTXI7pZ++TWbG/WN/ddvk+xhLKvW1fVuGHAR1WNaFzw5Kt55/QyH3KUeiMQGB7A==
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2018274185a.4.1791881327666;
        Tue, 13 Oct 2026 01:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2018271885a.4.1791881327187;
        Tue, 13 Oct 2026 01:48:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac35dfsm3905304f8f.33.2026.10.13.01.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:48:46 -0700 (PDT)
Message-ID: <8e42db37-3aad-4825-8287-8578fb3eadd3@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:48:44 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] thermal/drivers/loongson2: Fix Loongson-2K2000
 trip point programming
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
 <93d78dbedc091117d8fc7ecb29a0fdf2a6d096b7.1791512067.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <93d78dbedc091117d8fc7ecb29a0fdf2a6d096b7.1791512067.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX5pgZ2/jziRSo
 6iAdJDC+LsgOIDrVvluWt/aa2OvY8DHe4Qpq0WtpsnPP55J9pX7NhKS8DxLYw0pKGlHenhqM/EN
 m9ZUinZH/g4uGuOP6WyPU90VCRnJs1IE3gqZZ6O3si5Ks2+QvZoE7B1FdgBaRgGiv+L8h3CRWv9
 Zc2RDc5b7TXvXDXwmBOgb0/Vf1HcdQ5s2YYYVtM4Ypg7DfNK0Y2GWfhgCE+YP6nE/er79pRXdoQ
 0X5gaA91RidLx2/Vylmq9GCt/kAJLZwkKBu3XNCDR0VwqgO9y+CbFLvIVPKdZ81iTX/oVysbQQQ
 X0RLkrTDsfeyhIiLNshdrMx+E6atUNAPefwMIjThycNMdzkcEBeW2SYVO5BPhMcss30r8Z1PmeV
 /tvRVKJqb6ksUL2/4Z97Sh+S73vQmqpunIXiT5bpE194cN8Rp8dHzyQYB4NpYcQqv4fY8b67SAx
 s8IeHcYjuYR97sstv9Q==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdf070 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=B0Tmh5SJC70KtaT1dDUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: FH-HYxNIqjxUMnpC1N2eWpOk_OyebOxi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX0SOmt2li2yoN
 AbMOWgorcKtesAplJtYTOxGeF8EuD7EqOdqfWqeoLp5Ye0JHq1PlQRJwUB4jq9zy78xyDkEBCEH
 WEpV5PDmU5nAAwq67zQCCmkyb8vjdkI=
X-Proofpoint-GUID: FH-HYxNIqjxUMnpC1N2eWpOk_OyebOxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 10/9/26 04:58, Binbin Zhou wrote:
> The Loongson-2K2000 splits its 16-bit gate value across the control
> register (low byte) and a dedicated HI_GATE register (high byte), and
> derives the gate value from the target temperature with a different
> formula than the Loongson-2K1000.
> 
> Add a per-SoC set_trips_regs callback and implement the Loongson-2K2000
> variant alongside the existing Loongson-2K1000 one.
> 
> Cc: stable@vger.kernel.org
> Fixes: 734b5def91b5 ("thermal/drivers/loongson2: Add Loongson-2K2000 support")
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

[ ... ]

> +static void loongson2_thermal_set_trip_temp(struct loongson2_thermal_data *data,
> +					    int low, int high, bool enable)
>   {
> -	int reg_ctrl = 0;
> -	int reg_off  = data->chip_data->thermal_sensor_sel * 2;
> -	int ctrl_reg = low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTRL_HI_REG;
> +	low = clamp(low, -40000, 125000);
> +	high = clamp(high, -40000, 125000);
>   
> -	reg_ctrl = ctrl_data + HECTO;
> -	reg_ctrl |= enable ? 0x100 : 0;
> -	writew(reg_ctrl, data->ctrl_reg + ctrl_reg + reg_off);
> +	/* Set low temperature threshold */
> +	data->chip_data->set_trips_regs(data, low / (int)MILLI, true, enable);
> +
> +	/* Set high temperature threshold */
> +	data->chip_data->set_trips_regs(data, high / (int)MILLI, false, enable);

MILLIDEGREE_PER_DEGREE

>   }
>   
> -static int loongson2_thermal_set(struct loongson2_thermal_data *data,
> -				 int low, int high, bool enable)
> +static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
>   {
> -	/* Set low temperature threshold */
> -	loongson2_set_ctrl_regs(data, clamp(low, -40, 125), true, enable);
> +	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
>   
> -	/* Set high temperature threshold */
> -	loongson2_set_ctrl_regs(data, clamp(high, -40, 125), false, enable);
> +	loongson2_thermal_set_trip_temp(data, low, high, true);
>   
>   	return 0;
>   }
>   
> +static void loongson2_2k1000_set_trips_regs(struct loongson2_thermal_data *data,
> +					    int temp, bool low, bool enable)
> +{
> +	int reg_ctrl = 0;
> +	int reg_off  = data->chip_data->thermal_sensor_sel * 2;
> +	int ctrl_reg = low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTRL_HI_REG;
> +
> +	reg_ctrl = temp + HECTO;
> +	reg_ctrl |= enable ? 0x100 : 0;

bitfield.h helpers

> +	writew(reg_ctrl, data->ctrl_reg + ctrl_reg + reg_off);
> +}
> +
>   static int loongson2_2k1000_get_temp(struct thermal_zone_device *tz, int *temp)
>   {
>   	int val;
> @@ -81,6 +99,27 @@ static int loongson2_2k1000_get_temp(struct thermal_zone_device *tz, int *temp)
>   	return 0;
>   }
>   
> +static void loongson2_2k2000_set_trips_regs(struct loongson2_thermal_data *data,
> +					    int temp, bool low, bool enable)
> +{
> +	unsigned int sel = data->chip_data->thermal_sensor_sel;
> +	int hi_reg, ctrl_reg, val, gate;
> +
> +	gate = (temp + 311) * 0x4000 / 820;

litterals -> macro

> +	/* Low byte of the gate value goes to the control register */
> +	ctrl_reg = low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTRL_HI_REG;
> +	val = gate & 0xff;
> +	val |= enable ? 0x100 : 0;
> +	val |= sel << 10;
> +	writew(val, data->ctrl_reg + ctrl_reg + sel * 2);

bitfield.h helpers

> +	/* High byte of the gate value goes to the low byte of the HI_GATE register */
> +	hi_reg = low ? LS2K2000_THSENS_HI_GATE_LOW_REG : LS2K2000_THSENS_HI_GATE_HI_REG;
> +	val = (gate >> 8) & 0xff;
> +	writeb(val, data->ctrl_reg + hi_reg + sel);
> +}
> +

[ ... ]
