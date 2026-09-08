Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164982AD37
	for <loongarch@lists.linux.dev>; Tue,  8 Sep 2026 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836781; cv=none; b=Lztwr4HKLfMSHVypHZW0TP+ioUvgoSkXKUT7/GlamkFZ6078dSDETok9LkKDPCB4HuQrwwf8X9tVJtJNy14b7QxAVlgoNt5ENEmjurlHtNdti1Q2MU4uBoSRT+FxWUynFb7VPiz3u/ox7XiJJo9H9dzsoCTP4qajp0GvcpqdRqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836781; c=relaxed/simple;
	bh=JI1gDaiGExfkFf7o12oBro86gar1gFBU0XgxjnWY3FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmcCLXC6b7t+n94SBIjR52QSXDhCE6mOgBvXK/W7FZJfHCGjoxknYMSEj1mAFapN6X1k2nZIz7+67V80qzULyGxmiPNRU6tZq3EUU8R/P9TFMLtMfGJXMIVhXagzh4HFjB3Wq13NAGceGRgPlFqV3hoVdwDKF3stSEwhyyiTOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tczGJAsk; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tczGJAsk"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68801pt63372633;
	Tue, 8 Sep 2026 03:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JI1gDa
	iGExfkFf7o12oBro86gar1gFBU0XgxjnWY3FE=; b=tczGJAskUn5OHyfNYj9711
	w3rh84Sz65UGBIwENufTX/4E4Jj28t6+Yi9+zSR+yldPAvk6sjRdL3BJip1UmM7Y
	zDDfqo094aU/rCaWDHvk/mDPdF4ytY8n+2wodLkVUaCzthVJEiGV4uJai9tJdqKB
	O70Sfsv7QAw45NMKqXqYvBklV2JDCnAhqNmtv/1GVU5x44+9ft+XJror/7uSIWTl
	0L6Txy8QqLHi8EU1jRlDPW9nfH7HtpbjkahFqZt1Lew43WzgS4Yl/cPW87f5W+2u
	OaWCMxWo/jzYawegUSw2TSQfAldcqCyPqHukDvtbzetu4a2TF+n5V/xFfXWwAGyQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbhkm4v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 03:05:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6882uDAI006500;
	Tue, 8 Sep 2026 03:05:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggxdjs9bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 03:05:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68835tdS43057662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2026 03:05:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6456F20049;
	Tue,  8 Sep 2026 03:05:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B68B20040;
	Tue,  8 Sep 2026 03:05:52 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Sep 2026 03:05:52 +0000 (GMT)
Message-ID: <0e8d8903-069f-413d-b96c-5c8c501fb5cf@linux.ibm.com>
Date: Tue, 8 Sep 2026 08:35:51 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] liveupdate: kho: calculate per-node scratch sizes
 before allocation
To: George Guo <dongtai.guo@linux.dev>, Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
        Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
        changyuanl@google.com, akpm@linux-foundation.org,
        Huacai Chen <chenhuacai@kernel.org>, Kexin Liu <liukexin@kylinos.cn>,
        guodongtai@kylinos.cn, kexec@lists.infradead.org, linux-mm@kvack.org,
        loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260904025101.9959-1-dongtai.guo@linux.dev>
 <ap3IFd2FVvfKkHkV@kernel.org> <20260907102414.18958-1-dongtai.guo@linux.dev>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260907102414.18958-1-dongtai.guo@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAzMSBTYWx0ZWRfX8qhb1C1IzXnz
 PiQg8OpyvvK19tWxryma6GZPvHA7uePRzIcUnEjmAo1PirYBBKUJA7L/Eni32ft8eMaSipjP4it
 vl1qWUudZDYk4jnRx2RP+ayqlJMy0Sc=
X-Proofpoint-ORIG-GUID: L0d-Rs4RpZmoKJ_MI1mk07mjPeNv8GNW
X-Authority-Analysis: v=2.4 cv=NMDlPU6g c=1 sm=1 tr=0 ts=6a9f7b97 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=gLbRH2pEsQEO1hv6ekEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAzMSBTYWx0ZWRfX81vxZP+gH7sU
 B552ica4WgKl4/n31BNLO4r/I8rZ3hhu2zvYSN5f5/AWGBJGTnvbzn0cgqJ9KzCcO0lWxplCbtn
 kdaQD4j1zlJ2KKB7CdcQnUv2AeQLkqZide2n5plIoh7QrSt/PZxTwIbil5wKF+grAk8ALKuLBhr
 huES++m+OQmzUzqG/6MwBz8ZMMwqP67Zrf7WOhPcBzjWHHV2xmqB+QB85OQyDhEaHH9LVScmHcA
 P27nQ7PM6NZpoZ+/p3m1QOYMbOrV0rpENDavcS/4ic0gLOfT6J1Ii9usiUjnn5xoYg4y+5bTub7
 hRuBBKP5th1PS1C+0lcA7vJcF2Aik9XujxduKRNjtdn/fh+Wd331a+vPy983ZATiUy442K41RYT
 kD5R0CJh19vy+G85kPx1sE4ia/bGka/Z0Ti3YUQfKyVrsGRgebXv2I6Y3KT11Xgc89oomUu7j+u
 f5O7kNXZFp9Kw3OY1Vg==
X-Proofpoint-GUID: I9LhQLXtjZsXJNKbCckjExOK-cgk-eyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080031



On 07/09/26 15:54, George Guo wrote:
> Hi Mike,
>
>> This reads as LLM-generated text. Please add LLM attribution as per
>>
>> https://docs.kernel.org/process/coding-assistants.html#attribution
> I'll add the Assisted-by tag.
>
>> Can't we just calculated all the sizes first and than do the allocations?
> Yes, I'll rework this to calculate all scratch sizes together before
> allocating the scratch areas.
>
> Adding Sourabh to Cc, since this relates to the scratch-sizing discussion
> in the PowerPC KHO thread.
>
> Sourabh, this patch prevents newly allocated scratch areas from being
> counted in the per-node baseline. It does not address the overlap between
> global and per-node accounting. Could you review this approach as well?

Sure I will review your patch.

- Sourabh Jain

