Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE731ED83
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596154; cv=none; b=TKShrlaKEYAy6kMGphfLbEwbuBquGQWYbyR2DEYmDgTF47hxNbgRtDPziv6ciwGFsCetOjkPyILCo+qbpXK4ts/xH+Bg3oSUZ6ovNrQRKC0SaymxhctEHHu7eIqtPVP7HQOcBHsj4vxX52T8FGhercPHV37xLsOkmTlXgxUplHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596154; c=relaxed/simple;
	bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MQPBxdbVjJsqz5n6SrTU5utSMJM+FV+BIiVnMW8alcoFumiQRnFV+sc+nG5pgwlAAhee3ODyYvy1Lap6mtcfoWGZhYc4mKXsJV0hZESXdNADH26TdXKvdxLb5WQrhneq9c6PrIT/8CX6YNYRP5mvxTqpaUTqdRi89fwjoIUeopI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTI7fkXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8+oFWQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTI7fkXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8+oFWQu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax01w1482448
	for <loongarch@lists.linux.dev>; Thu, 9 Jul 2026 11:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=; b=jTI7fkXQl7cmfY8u
	/6bNS+Fwu0N0JYJjqKlpNE/bUkl2mhzeMCIy9YTKs/eoShIUpl8OQCJgxUcCe1Qs
	3cJw4qK9vv+hDmJX2IozRyra6X37WE8v8Vxl6bxaUL0j5/MLQKzhvIKs34reKXrh
	QWs1Vb41u8wIG/o9knrL4GgKq2/ZBNYGTwPnHTuT5u7jJ3EMLnaiRdEBXGlLErlS
	QMBDjPbvcSMQgesyK7qkf9Xbt4GVvlCDF7pU0Ep4e6tiqGpO14UiKVK+WJIifgMb
	eFDVUlYtLgbk+5e07s9PeDWnBLvsQTPHVnHxEKk6PFxWS/VH6saUNZqOsHQv410+
	3wCVHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtbe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:22:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso16217321cf.1
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596150; x=1784200950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
        b=T8+oFWQursUddzOxI6VzecDFYObdcRHBPQu0CxD3aD5l3FwE4MWvqyZGwuku71FFjG
         auelSqQYdpHtDJQfrn58H3Xs48Qp6Bh1zFVe3azS9hA3dTgYhW99FJlKdroqXWzHVkI7
         58UfmOUnMWb9aAiiKE5uEKgEt/DsqL9h5Xp8N9hjolLvUURZxOCJn0xRcLgsXSG4x9Un
         X3mDfpLdbVLmA4m8IxWGlzDZgcGY8fnaNdchB2X51eBkrUdxWWbjX2Uy4/X0RqndU34s
         6jZ+JbHC+wYyQ3INohNxINa2QDlkhKS3/9jHGcNTfcH/LASLvdNSVK4vn064iTiH5RqN
         89HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596150; x=1784200950;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
        b=EZqcd8nbxgiieTFjME1qmemdDpmT4wLFTJB13mWdMNctD2o1JZ7MQhysNiAaxVAWKN
         houfsjupY8jT/c1e9svzHoZm0e3kgZgigkhf4ZjxSon3xPCbe/FrvaBty7BFYzL3IiQJ
         uJeIblMYr7rwBRe7FKL0//nC4SYZWfmdaSK31StKnPhPMFrxqGpWysxnrSs85N658xBJ
         WibQB9xaFNOtXtAKeC8r29X/XXg/Hc+eGLPDFoHEA5GEeBCCHoPZ7l1iYu6ZHXUDUCa0
         cRAjYHEw+zbMixYniuycJoxi4Fp6kZXNHQOEj7M4Zp90JUr20xqy/0i0ZYcOcH3I/i8l
         62xw==
X-Forwarded-Encrypted: i=1; AHgh+RrQkQURAc6NzCTBWNHXUdZCHkwwsEsDaZSQY2D/wssDHVxiSEIXlDhrpnQcHqjmolpZPovY5KqJ/ko=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqHmeeRnrZaie0kzLhO8fpGIIHjKdYcPhFGHpRWCJjtF4eAdQh
	dAgBJXL6hYy2wCaWmnutXG55THNxdUI2i1vASxMCyjyOXuCOry2JHxTTq4KbkFLBD4GfO9SP8H2
	X0P2z4L4td1TqHpGX2WDinSGA1Q4Fngqtf7atjsH2y0y+eKWwhosq3SIV8XubyRs=
X-Gm-Gg: AfdE7cmC62OshiBd6Iwp8loE0VfQBSPM76XDlNBZZuKztYqdEz1UAAoVdwJuD0M5TVP
	HxzG4cjpk+SYMsmDXSc9NFM4pna2XBJSn+un5kdtqnuCjLsZNLosZ156aWxlIIR/xuc64zUl2k3
	eH4POwfThYF4mbQt+Wbrj9qTQi7gO8VIzrtJtXtVi9rdi77C5Sy5AYWOCKxgV0TLzkA6Se4z1h5
	QWJqxfyJdxnNwSt1WMOgoeYVj3HcxEz4tdRNRH/TQz9AsLXRrdHlJ6MaFp1Wx2PHiqGjeGARLgK
	PGAArCZYcgbad4LXWBHSl5QgMAlZA4+nCg9ixmDLracqPPiOTbx35KwTqVhF6p41PQ1bFFXT6Dt
	I6YrHZVlXhGH8KU3Fb2oUn1itiIwFINpufmgUGvIURUKMXdLl4Oxz38HkYb+HRg==
X-Received: by 2002:ac8:58d4:0:b0:51a:8c86:bd4a with SMTP id d75a77b69052e-51c8b407e1cmr74987771cf.71.1783596150578;
        Thu, 09 Jul 2026 04:22:30 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:51a:8c86:bd4a with SMTP id d75a77b69052e-51c8b407e1cmr74987351cf.71.1783596150195;
        Thu, 09 Jul 2026 04:22:30 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm50814277f8f.5.2026.07.09.04.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:22:29 -0700 (PDT)
Message-ID: <ea24e611-91e0-4397-a49c-1493966094f9@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:22:26 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
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
 <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
In-Reply-To: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX60PEgefvAthS
 ChyvDvbrlYK+37VqtaGlnHkeRCHuKieA6TbhzIoRivzykm3ufmHJwnPhc2qQqhpoVbX7LrDVgHo
 sTZIEG/BGhbTfTGeV3tjpgjTPYIv+ko=
X-Proofpoint-ORIG-GUID: _dn45hlCMYrzoevcBPjgwKHN2PgUO5jS
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f8477 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _dn45hlCMYrzoevcBPjgwKHN2PgUO5jS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXx24DXwostgIN
 wVMA02UhU9kRlMDro3+tdRyUYOEmGmAGKjZ617WBAJvRmrC72oPZM9OuvCd4z/fNybR4PhqayJX
 nM4WX982hOcK894Z079Xdo0rJll4aGvN7rf1GRMSE/ivdAOAZBa7beD/aEZ02H/T7gNmb3nRrde
 xw9vFFLa/U6QIr6R2ptYhd6EUm0eCq//Nwz2ZDwnvI+hMNFdI0k+PLIXz/OanwfUcRz8mnVMUWH
 Y/WXYAiztjGMXGIcezjxpvLt+UV1YoRBzvlxF60i+FtT3K26szwLe/QJX6pq7bYaJLZrv2wGhj+
 ddDljvL3HGLnJ1Z/woMVxeBce76EFo1x7muwILHRjVEBbMXnLs62C1O7+pQjrTf/NT4fZTQLHeF
 V5iVhLf7fDEldkdX5RcGBZzyvgvifPe9qbMKI4/e+k+/kFOhjOaha1iCZnURAzT+Vdpz1lecnG/
 iOsCgvKVuR/yPWAH5Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 9/7/26 13:20, Philippe Mathieu-DaudÃ© wrote:
> On 7/7/26 21:06, Thomas Gleixner wrote:
>> rseq_syscall_enter_work() is invoked before the syscall number can be
>> modified. So there is no point in rereading it from pt_regs.
>>
>> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>> ---
>>   include/linux/entry-common.h |    9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

