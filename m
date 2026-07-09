Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902F540FD9B
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595820; cv=none; b=KzV66Scgf2zj3xeHHYWMgeIeMgTejp5W2Z8qYcZ+TCVqM82Whl043L7pTzpzY7SORmgykP/sIT+cSMUbNDFHQxtd89+39PhJyQFvrJWS73Wkq5gaJ/36SXR1pfncMRAN+YlAZ4OlbrH+2XzAsWyGqH1ay51o4+kDGokV+D8in1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595820; c=relaxed/simple;
	bh=tutnNf9YAg3H/q95A7Iik+KRuKDbYTmWKhCV2b/wa50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMVkb8v3W0GTx/CGbbRvCjZ9rGVuZZA5NIrEHkfHbgDeYSvUYyY7sZSwWMjXwbX1ZjLB1uoxtfcennxD1lw/1Xx1ml9khwT2RZty0gfxudEZchZTU/uw+KLN07FwXv4bBtHM0Q6ltl+Y1sH71MfK0qw+VWV+ZnGjql932al16l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZBcJAam; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gc9j9Yit; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZBcJAam";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gc9j9Yit"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxOhn1484336
	for <loongarch@lists.linux.dev>; Thu, 9 Jul 2026 11:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=; b=bZBcJAam+ibbXFwx
	fYme4cr8sBqjGZ8/bhY813m3zZdemgRcv+ZZn5hEkMKaS7vw0Lsk0C+lZaMW/4N7
	48Ti3b9W5djrMW6C6sRvr/fRMwvlr3Xwdk0O8mST92o98b2JRkz34WzfXmdlRdyc
	+GNzKHdNyJRx4XFA9Y/FW2dL+68kjj0jsC9rEzLvB9U2wtPREHvCZncHnjBH0nco
	DqfIf8EOVkC/PQXn3R9FFwNfO+c4fAiAxBDB9r3vKIUe0k0qjSg4thZ00H8jr+97
	7VzXtBysfy4u+kGoa711kKXXJoacuD/Fbabaj49b91/ZVeI4dz7AgvccLaeW9YDn
	oHnuIA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtamn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 11:16:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso8967981cf.1
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595816; x=1784200616; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=Gc9j9YitsIg4/PgqjiBTBVZFNKsDh1Gj3EC8DwVaNOy4H8mBT8DNlI9QCuBvzF2pd4
         ButblhdvebbugggwFDiQcIewcFh9mWob3yCIO1RBHlKbP/fso/JnViyYu5eWH6VIqQzF
         oTGRtLi3oNEEWkRFZquyGbiRt6IyT6xL5hBl0XJkETWlxoyOmq+FiGP5v1+3ZfzbwmUf
         mfb8N3IJt8rwjObbn2k1c0wejxvtvVcUMeBv4rIl72qlQy4DVcFZrHc8phX019O8uFuA
         1aXM11AdlKtLQLe8YkwQ9BgUYpMtfDp9NykxKqWtnaDzniBXZWNx8THIzDxk0j9fssN0
         Y6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595816; x=1784200616;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=pjt0yuOdlXQ6esUgt30NnwEo+QVkKTkPKXT4g+E98zPNEaOmw+/aan/myazhkUKP11
         bZp6yC/J8SeWN2ls4sGytIDrOv44gqEn2DzupFbAqd5JUiSVnIgOlBkRYnfUE4BMFFQs
         Rs6M1O+GH28l4EdEG5ZXC7AAwlQRPiA+05rCST2SismD/Fmd+QhkQ2dMHczEAU0YEAv9
         oHSSUXP5S03OJProDujYj64pxwYf1LcLTH85Ms8QVD/Ba2/qH2wffoAkVi+2DFDoZHt1
         6ezDFx47VXmPMvNNb2e5VuSYfBCvx2mdSMrlx+1Zzz7fxivNILeYIiy0M0A8hVPNfryt
         wghw==
X-Forwarded-Encrypted: i=1; AHgh+RpumsQfcrnfBzNSmCE23o4YgQs1HRZJ2BJF99AffbTtogTqZp/Jen0YsGnR42uRg8ajaKYCgUvm+t4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7UPqIu/IvEeuFQaUpBCGf6VzGSnISTkYnjKSFOAIvHEMZUJz1
	mfbGJiXa6t7IOjiwTt9rV7aFO5UUbqi9SlZ5tTXbnzuqbj+BWZsLVpoGX9qnHKHSGcCk8ksZvcE
	so8EBgMWP0geBJTQIpaRBjQBvSmMUf6B83LdYG8xYubmaT7slxAvr/5LinAKn6oI=
X-Gm-Gg: AfdE7ck4G5lm2kLuKX5q8rBad/J56LhpxrLZpZJeSKODUY4C1k25sgjMtbihKtsEa2A
	3aYp3zoXW5eh0dFpyyLdjOgcdL7eOQJUA7eOskwtfJ7rZdRoSEdhtAp4kkqsHVuKJYxHdQxPoPG
	h/rDbFiyEJQXRakSLPlkN+uibQukUUxRoRDBz3jQkv/dyWO+iI0qWwrBzLWlEQ/ynDmgq2OAS30
	6/0x/9t9NatPym76cGIdDVOxyVw0coIjf2VOAn0WUVeR2c8xOaly30neWNigYN6QEjxcHMLzqRF
	PdzzOFlkimzN1SydRKW8VYtusm+mh3kidC9oiZQIVBEuioZBkmvyCirmFC+9O+J2XodrOK+4Hnt
	WH1oj2B3X1fbixizPJM7Yw9KxAuKzQsqMWW+o7RZF0M+avqErgmKX7XYAW6tR0A==
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236691cf.41.1783595815676;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236071cf.41.1783595815288;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm51612968f8f.15.2026.07.09.04.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:54 -0700 (PDT)
Message-ID: <b2ca1416-e2c1-46ac-8a26-ce671c76883f@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:51 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>,
        linux-s390@vger.kernel.org, x86@kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
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
 <20260707190253.974626922@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.974626922@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX50/AKmd0PvLR
 ya94zoKZjOzA3xRpbxznOoh+HUIoZAZZx8f7iEHMH9Cwa63+oy5j8IBDp2JInE/lCfN77B8G+UP
 5w4dQj/SlyUWlJ15y6oKHcZu8UVneMU=
X-Proofpoint-ORIG-GUID: BY77HU8gqg4QKzIpvoRRkVMI2rOmpZ2b
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f8328 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: BY77HU8gqg4QKzIpvoRRkVMI2rOmpZ2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX2Mudb8JPbpa5
 0pyJ+0MtbHHDBLHyrTXVwDNwBW+s/BY+YBxf6bqVHnhRehNTqWhiRKKeAIYgOgJe5whW3yDef8v
 wqMnxrJfntqBiUHeyx/oKIBJiNUofyW6gSJuMGZRtsr+eH4sNUB/FT2Y6C7aJuylaOP9/qfvKih
 41mC3ubwb2pFRU4vebDh8dAzguBmkRlXUAy9ViUxsSmWJAL/UGdrMzQ2Xwf9D0lFSY8UJqp5uXr
 F96rMlfxoYKsmzDaYKXZR22DBy62cmTqes5cT7wjOWK/lUtpoqXuIH/kX3l3hfqaYOAaV/SW+DA
 4mQYOozL9zKzAY2tQdRpkTETrUrAoetd70zhWOb/P1pYc4A97cdvhx5ZKNEwb2YDpnG4Ti4xFxT
 R44jVSnYIPhm1MYJPWF1oWw84u7M0Er1oJF77mVwkccfZ4xC7csDUtk1EUtW5kc76GzOq+j5H0u
 JzM0PBPmJabtsCRyJQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 7/7/26 21:06, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>   arch/riscv/kernel/traps.c |    5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
