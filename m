Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FE0410D32
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595845; cv=none; b=R8xSsUed2Q+yMogBvyhMmYrwu/IKa6BF2NX2ugfGeGRFMhWLLOA//+UH0pMGm9vfvo1VrCvTAK9F9jmwhwvnroPj0PNywKiv3Y21Y/HDpGfxPriQm6RwUzg8UoAp+dlyWsZQoaO7TYA8C2BRbIKe0onv/fGlZzOVYj5PBZlWqvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595845; c=relaxed/simple;
	bh=nrb0ag4EBTliR8HEhFNdNbVVIK/JUBRD2JKlM2G1ar0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUAcz6eXza/na8ItjxTmj1haE4k89Zii3wH+H1Qljt7mmwcM5bI+MDntu8SpeBzGBcF74nrWQ0SPIpkjE3Yt45ivJZik9ayVlhzHfNwmWKGKlc/qOqtzdaL1DTQd/8S0Wx2jH2v6dXGP1lwX02vpvr6NeFWST8xNSib5TBTpL1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5+SzP63; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dthi9S7H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5+SzP63";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dthi9S7H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax0131482448
	for <loongarch@lists.linux.dev>; Thu, 9 Jul 2026 11:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=; b=L5+SzP63bgPAWhp4
	W0cUVg2l9n9I+4k0Akz43rpejx4oS0/IbbWAmLMXE7C9F37E36sY/GsXk3zuJt0e
	7WRl8xWn74pDgWLAKB7VqpUweKGfDHpjZadrDE/thxVaWuDjHJ729famrINqKMDx
	0upb87A5cv2e3e9cOgTo/VDABpH4Tf/6q96s0WSa2IFCTqdWIxx3GVEJhdklhdir
	gMzNGoVv54cFMR8lTrj5sNzMMQDcUrBjV8bPTBpznG6YMJOrkgy1v18t2RPVEfx/
	2v3dDdCotvg9oshrPidheW6ip0HZ0YECDQHkCxRsQPUi1HLjdw3FRE6oVFrVR41W
	qvGWIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtapu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:17:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso12208571cf.2
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595841; x=1784200641; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=;
        b=dthi9S7HAyd+4RhCFLm37woc3PHDxpcd+2sTOUj5Bs2Lag8Nas79O2X+WvqIHxulTg
         iDlbNoP40nu0SPslPhm78SYPiD0j0bMSEbo/n/Xbd9nX/vt351fJ1o/tMd04DIkbnmur
         WmmJg4K/hf8Z5nPGVGaEf1lstT8hgcE7ySaH/OK2yggH986Yf2hgwrPrfOmkQyqSkr4E
         O2pYJ2o48AWqzLzA0T0QzmlTAyBMkEBqbAsvEn/3Rt1f3eUXFF6cC0OzfWBtFQouQ0im
         Kp0lb2W0yiCxqFjQ/pmLsUknWnkTQlkzynmtDkl+JiFbN0MdFiYB/oJQLRkvf2QmG7YF
         d1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595841; x=1784200641;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=;
        b=kZ/Kl6LjC47E81NCYOegC/tMJLqIGhtP02IlwMiBPYgiwh9TOXJVtBB1hqsp4KcbHK
         hysLLNOFhNBeM4BdWLjikwoPlItmqp5NrKc6eLMUPAhoLVI7ao4ptoRtFLM355EoUZj4
         ncvS61Jgnxf9wkVmizcKPRFS+MNxvWMcWrAREDZa7QH8r1DeM4u0PQeO8cOusES4rdgE
         ycpG525fU5OJAN/bs9qEApyOxKxNi3E8RsDXL3J7Am0AXjrblj/iJ9rnV190CT+10iU7
         8gX0AAW80b7nXLDlbjJ22TdZbQ68mrEcV0jsy2bFoYfKEuzTGuRJs9/hOcVpAvI705o5
         N36Q==
X-Forwarded-Encrypted: i=1; AHgh+RrVuxp6Xj1x/zViQtBo61j80okgfnrqcD2gQWiH1XhC90NZMgseuCfZYbLWgMIokQlMkcVKzUANq/U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ0rw/uH41N3Bg4OSdD8bKmd1NjDjS6+qEZgivMQucE73jf6lL
	470y3K9+P9vPzv3LU0inFjnMI6wKZ8nRZu2O2UD2I3P3//QrrcYY+DKty7yqutloLJe18grg0M4
	wU0qOKbGGaPOWPf2N1fbx2QkYf976j9SBqsFel3V+3V7W5uKR9Dv5Xp9iFrcXY24=
X-Gm-Gg: AfdE7clQlzQPz1fpWfqiS5wTb2fLuiHHV201TOBhe/5mIDpIer6MrCHbUfBXyseSqOz
	ggC2bnvgWQxTHlfWUPOVBA7kFj2dvm2WezwWSsXPkjERunc97e9gVHwemwAgMUULJQJt9JXxcB2
	uI81EiF+q6hy0rz7tqYq0nc0ICzMeKVc8i1zJn8yeKWlMCfwqQ0LDjQB7tiybBXSMoT059h0THb
	BpcHSOWJcL57FpLP1rZpA7kNbETo2XRnOctbYuGztk+BB4JhVDf0CSjEOnQfKBizx1EeYHqcHCO
	PLn9IkWkBW/yA2RXpDhhELVxRoY2EmTPunkh+9Zu3tugq1yHPyCzH5xY3JGjAiwKb0i5rTH38kc
	LY13Pa0DUzJYIkWBiFLkbw91qySQ7fAFXp1J/berpUSSMSA6byAicRgooyMBvgg==
X-Received: by 2002:a05:622a:c86:b0:51c:7b11:41b2 with SMTP id d75a77b69052e-51c8b51c97cmr72541721cf.78.1783595841163;
        Thu, 09 Jul 2026 04:17:21 -0700 (PDT)
X-Received: by 2002:a05:622a:c86:b0:51c:7b11:41b2 with SMTP id d75a77b69052e-51c8b51c97cmr72541381cf.78.1783595840774;
        Thu, 09 Jul 2026 04:17:20 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm54034235e9.1.2026.07.09.04.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:17:20 -0700 (PDT)
Message-ID: <8d15c107-30b1-48df-9e69-a7e8520f4e36@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:17:17 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, Thomas Gleixner <tglx@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190254.030598804@kernel.org>
 <499eca86-8def-4044-8b69-8f290528e10f@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <499eca86-8def-4044-8b69-8f290528e10f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX+TQ2yvx9ufPQ
 kWRSJeEUtK0HHZYw2ujIQdZClKl0wrg4S2ba7PSvzJJ+47NEOPY2kVknztFCGX5b/0VXCmPfKw8
 0RMv7SkuX56I/FtZc/RqFR5Ular4jgQ=
X-Proofpoint-ORIG-GUID: VY9gWMDy4Dl-8QOaLsVmP7a__w5parz4
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f8342 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VY9gWMDy4Dl-8QOaLsVmP7a__w5parz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX3xeUf2E9sMVP
 S7kdqIh4eB1BYZZqsUrFfW6BJip8FMwHRrRSFlt8IR2YPJv4pgiKYjgcabRD2w8UYHdjtetmuvs
 M0CBXqn9ez/kpy1gxdDpzjkfW1TODLipzp7Iyk/xNxBNubP+yiw78lQ6M3bOJlGHeR7r4un0+IV
 SiJlebWmxFP0vkoA2i/VTIQBLPvfrQTo9uFDajgp/K/R7awwP6uZE+R5WWX30jen4EfsrrkkDsh
 BzrKBjUBpjwb63bIIMs/bo7Kx04r64/C1YzZ1uA2yqeU8GUhqXO9Wi7Ds1Mn8AJB0ZJZ69ujdrH
 +1fJO0f8U3KAWDXsK4SxNbRMD6dz7oKKffTxbFKRKLwi1fSvH3xG4rwhR3q4/s+PYnXrsrc3tKM
 6oIGvuHpSeSIHpHml2FfZPHzl64jPWJ4HJtJpIY0cYPB1hgyeI8aW/5xQvFzOTLi4wcGYhKmLGx
 N5daEXQ6lMdTMUj9KLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 9/7/26 04:46, Jinjie Ruan wrote:
> 
> 
> On 7/8/2026 3:06 AM, Thomas Gleixner wrote:
>> enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
>> the subsequent invocation of add_random_kstack_offset_irqsoff().
>>
>> As a bonus this avoids the overhead of get/put_cpu_var() in
>> add_random_kstack_offset().
>>
>> No functional change.
>>
>> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>> Cc: Sven Schnelle <svens@linux.ibm.com>
>> Cc: linux-s390@vger.kernel.org
>> ---
>>   arch/s390/kernel/syscall.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> --- a/arch/s390/kernel/syscall.c
>> +++ b/arch/s390/kernel/syscall.c
>> @@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
>>   {
>>   	unsigned long nr;
>>   
>> -	enter_from_user_mode(regs);
>> -	add_random_kstack_offset();
>> +	enter_from_user_mode_randomize_stack(regs);
> 
> The #include <linux/randomize_kstack.h> can be removed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

