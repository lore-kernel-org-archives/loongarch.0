Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB69411675
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596052; cv=none; b=NFBMu5MtJEu5Y9SKp8SmHOcasSt+VvqYqtO419S27BzA46mVkarxOK05RzbxNleQwI/nxMC2u00jtRwanU7daWM0V4uxDc0u9qlKsm1gIS1SjbkRLO3N9Wo4xqClnVVW8UE/UbRIsHL1t6vt11waYw3wB42zPK4Bvc4wuRNVwko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596052; c=relaxed/simple;
	bh=R+aFi5Oqdv0TDSr7wZR2WAPngeBl4pJ5LsNFoxiZF8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1nrhCMZWaYkwfqYdIyBt5gCNPSbZhIVicTtgc5dI7TqY7um22sebVhtYXUIT4NBNikVUVNFxGZDSBLh2vQuXcpDXU8a38UaB1W1T35uY7rUkkDrLT6LUnfdiZQSnQbK2jtR9OIXxRHI7JzyZjrvZU6k4amn3vTf+ykOU1d3Wfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOWfjmK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOXVLPIx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOWfjmK8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aOXVLPIx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Axiw61614738
	for <loongarch@lists.linux.dev>; Thu, 9 Jul 2026 11:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=; b=iOWfjmK8f8Y+DVJW
	EcnBVbRqoFetWpR+MvbIm0rNsCYEYiCVdv/jb+r7ZZuAst5pdACVTyVPX1hk4M4R
	UloW32yrnx0br0O0OZPBTsUXsGcPSz6fo0b7Z9SsSAlawkneGV3knPcGuKS4ecbQ
	qUgL7kJ1kZwezKuA1OHch6fG0wR/9IjoD0gaRXopgi656DtKQN7lmNG5nDcMpELo
	+2tydKrnvkk1mYPsPWN5nD/hRUDpTxejd9pRgo55t5XyFzKGEVSWfHJeObs1qXCX
	o+wuU7kKSC/wnWW5kZ8U0x7Pvu4fl9GPrm5rLmSBf6RmcKnNqHf8RgkEBJ09ZjsD
	t7y3cw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6ke5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:20:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso18489931cf.3
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596047; x=1784200847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=aOXVLPIx/6czg3JwVkMmQOIVxqiNccH/ST+vVs+0AZm9IJEyVy+97splem0NwC8C/l
         1pbfrju93pHEpCjHl68pYzpWSlcvxhMBy0rV9VcDj6JLm5l0KO4kZb3qPT5B4bA+COEP
         t10qmKgKLb5kBdRRuFWB/ZeQhkxuAza4rPoqOiULPqXX4q1+F4YQeVxB+jhWZ6Jpisd8
         k6BXkttSxsqve/ta+ryG+1tvqQ/lL0nObwxZRJjVLd0t3Ys4p509kh+oY47H5gxQc7R7
         p26TXbqnWoP3F59dWA5VNnUt0MlSXNAvv78tcCvb9Hxe8hHkRkRDWPMlVnFKD5wP5NGj
         Ynxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596047; x=1784200847;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=b8Lp1T526PnpBk1YiI/PQep0DsfLDW/GBKk6m6JAHEFw8HazMa6bnbcIjO1esMlNoG
         3gOsf+vYlB2zYVPg+b22THC9j+/oNl1E7zqI3EWmBBblU2bEDXqow8+Sft24rI/Kfhgg
         HS99y2pLAgl9dYpHTscArzU5EflM+0xhUtTLaRMPS/R25FTqHOVm5/KgU7CjEbuB5Uad
         avk9C0yA3AgcWd1oVQy0G4OoLPYkuYovIxJpPGiDaywaozUA18E2XuG5jTgTqn9gWn+w
         MAMbcTGNRppNt+MGRb7RIKFw9CsbVaoKUzsoKEOZCKOhLrlZVF+aOKV3WV+XE5f2ZG2p
         N2sQ==
X-Forwarded-Encrypted: i=1; AHgh+RrraHRXrvsUJEDf2iPp0tABLfsDmdgrU362m4cvbOiWdIVR5V2uWER6ZKFMIPO44SEtU0Ve0lQgTw0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZbDDZrEUl0moada7QfWn5/zMjt5Tea4vB5CE48y6/LFH/EkzT
	ZV4VVtMf0hMbtTGDLsIRdxrQ3nNSBoNAzhBWuInPzzhm7S54YSDp+N+9z40rt+RbnrbSeCmaVVo
	EpnFT1Zy+lE7mfRXrBWnpwIlpGpgWIFeW4IekfHErXeMHV5OBb1oCKbphIE3Hn/U=
X-Gm-Gg: AfdE7cmXt5KKHMgEEleeopE54j30gyqk+ATrF+mxvP1Oqs8gWJ2F2hD2Du1d3ng1bNi
	PyqO2gGDayVJbRWkT0jAODBxFJSrJXzDh+rP4YR4x4lxBfFZB0lts3B8W+feP2oY9zY9r4KpNdG
	l5GdKvrO4IPrE6/m1NUEGlKQu/P5SJHcSNd3SalqskeVvtdgKCtiQystCjib+LgD0DaeZt/p/aQ
	DeCWstTrds8dw6DaMQdenf/cI6z5UuMuwTeqh3NiQ7hiqlP9Ur5p9PguBjwsqaWqC3OZyhajgrq
	PtZ4F+hploH274xDsAKR4C1WiH1fzgGdXVqISoMoTO9S5j1JONgoIdCJ+sBfMhJdA181RJ7TEYu
	MIoixMnPF5C7Io0BnBOQH5oe4Rd4GIE/X/c2I3XrAq8DwdPofpM2OAgEr3/BiyQ==
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754761cf.27.1783596047565;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754181cf.27.1783596047072;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm1861799a12.31.2026.07.09.04.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:20:46 -0700 (PDT)
Message-ID: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:20:43 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
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
 <20260707190254.181086755@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190254.181086755@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX7yeWPwdaqxuw
 HZZ3CVyHHM7qeEbwYe5jv6LSbC6SAIRK0WaPvoKVf0C/e+ea9gELyBhIuBZ15LS4AVAhrjr8FfN
 V2tYNJaRptI1x6VQp64iD+wnLrTcJLw=
X-Proofpoint-GUID: sc-cNckdbRC-7qF15eaK38-m5nWs6DRu
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f8410 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=uucGcSui7XbmpEV0VHgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: sc-cNckdbRC-7qF15eaK38-m5nWs6DRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX/6zbYhbdItWH
 7evh7r/zay28xEXHR4haNf4nkziRy47Zlh68MMUuEMEV3zCLH5k4zh4I18Buh1vTWOFt8HrcmMa
 PKr8An089UfDUp7GoeTv0kSXgmzTfPn3qYLpMPYcwHoa6QYfFr9UKOf6eq2aZcXZhpC3uZmYQMx
 K1UvhNn2UdKgcusjtPczEs/KY4OCuGKwlf06fbLFxxyMqjTh0TbiedSn3LUFON83OtEFB0IQt5J
 GTuAfrFSUcXGEByoKeLJMhh9kECf9PPO+2q7RmfvmabRnvhePYk0Plp08/qilzsFtpO+/2H7NtQ
 /j0ebw3JOk+Q4TRFbGi4/fr7AA+2Wj77wkjbzboPmSzgoFrQ8RyHVxIZngXobu3M+d6pDhZpaRB
 0SyZZWd+BiYTeGOclnyY+SLp9OuTKRLZoceWV8UXsVjh7Fb/xfoE0wDPHKeY++AEofZpgXNxyLL
 WYo3eSibqaxdCaH9PFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 7/7/26 21:06, Thomas Gleixner wrote:
> rseq_syscall_enter_work() is invoked before the syscall number can be
> modified. So there is no point in rereading it from pt_regs.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>   include/linux/entry-common.h |    9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)


