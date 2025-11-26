Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC921D3F0
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150463; cv=none; b=nq7TN/NsUQP9E1gocbgFv4YEldxaXj4y4SRoR87YldioR6MLLj/Exme3Jvgb4dIySJhJLWA5kf6jWDtKrg3xKyrNaDa8ECbMYjqpZlmzv8NNQyC99Y0DCwLGCNi8p+i/sdOOFKr8uZB32IKWa3zsWBPm6xzD+h+uFussGz67qvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150463; c=relaxed/simple;
	bh=gnAQilz+sltlSlxOIZKS+cb5aNOMstG3IC++/KZZlKo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=arvKmF8ecih8UQq1e+7s1+zBo/Wtpfc9xDj0gZIP0ujoNcQu5VKOos5hJPn9AX3EmNPs3TYGxkYgLPwACy4v09b6LUqB/0gZqYmiyvUjM5kekuixUhk3vJOJzU/uHBl8cdbv8NwuQn2yF2le7xtdPGe94JW3QpVIjFj3vIzXT/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=hS+A2ynE; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="hS+A2ynE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764150433;
	bh=7GEuqADJgwJKuSW+MKOcrehoKRz1AbfRfcHZQ9kl1oQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=hS+A2ynEwheS5Oj4AhDquU4ikylkLdFxpVkNuC7afBoKZTfptf5//Lz5h9X+qKMva
	 CmfmYUAA0E5PLG0RCyFRErwnpEf1OOW3rgfD8J+yZypMM+pc0SCMB+YlN3Bk1cwPq4
	 69iCbgi8oBHIexeP0pUVPL45Cq7yUA+66ukpwdog=
X-QQ-mid: zesmtpsz5t1764150426tec8ab4d1
X-QQ-Originating-IP: fsQ/YmoYH6Al11VamPaeCiEUWGyj5wdgOlx73EWJprM=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 17:47:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11577816222701975207
Message-ID: <1181117654604707+19e1f957-3fd5-4768-a575-397c17d4d1d4@uniontech.com>
Date: Wed, 26 Nov 2025 17:47:04 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Qiang Ma <maqianga@uniontech.com>
Subject: Re: [PATCH] LoongArch: Correct the calculation logic of thread_count
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name
References: <20251126023631.3143434-1-maqianga@uniontech.com>
Content-Language: en-US
In-Reply-To: <20251126023631.3143434-1-maqianga@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N61MakLYUF4qbOoXax6aForlUD6PhIRoH4zaSfxybnojoNk9OdnHqiVX
	rlnrIg/6FECjt9SgBwPHyiJbhA3AUPV/s2vXp8yWfMhUglm5U1id4ovNpNh+xaBnrhvQMLo
	f0QWMgCxG17xqmHdwZeNC06PHHqRRImCGGNfDiyYDs74MiJiD4ZR1w6DYUBnx/364ri3KNd
	ZiZhYkOyezF/YbirDqYxQZszxJtIN86/6tVcObpjcAZB5lOj44z9pwsYNaa5LkqtEiZESmU
	hjU+fEMgmNezf/EZnHD6NFw3u2z8GTh3D4+UTJ7kfxpCe1plgnsFDDHR6jWEa/i4A8NhAeb
	rQZ1alYGpmUiRTt9kkxa31qgCjLccqX54kl/aGf4OQ3D4eQEwm2uO0jE9/jfiEWk62Jv+Fy
	u43Jl8mvmaTPERWN+Gx6U4/1vJmf3ED8i8BWpndtNtoL5r+54EwcWS4h/j8U9hI8qER1mdY
	npkuCNptr4Tq7RsAQr5o0a3wkc+71ZGSdwFISZ/M7KOC9ATNuQ1S/IMLOTgNhnP4lR1Wo59
	3Mw2ROWLK8xpV9vIaYQ87FVUgEuboDulGymwxvs4Wp+unZ7IVEf0GOmSGFjAwIA62OTr+ru
	0B1XfpdbCUIupfkvvVfYZEK96mAabrcWsBrSHi+kSnRK0zAVjq9T2DBmdd9X51XAxn5/A90
	0P82DdiqTXf2AuYIcQdxJLMLOlav9A/vMEq+Cuq1CgU/U0+lyCENpkdfGEoOXDczM2jWE+a
	YQl5srHWcSyaYcL+qLRinq/0B81YzXfXipHYteXTDvpxXjFIiYD/2pb4IMSfpuRjwBlsJll
	yRj+o4Lh2buC6aDwhXy/BjjQESVQIQa1PwU09aPNy2Tk2Eyx57P6phjztWurlPIZQzB8aEJ
	Ml5K1F1234VTRwrS9zVRmApp/t+iTBpBt/QKrgL4++DCsNL8kGqxvWToA4ust6hRqCiJqfX
	l4PdgUwh5nJ+N2l3SmzdNWy2fmCGYQuni1hqssq+2hi49Sk9j0jsosrIYgA+j1lawMB6uQt
	DW+jxpriuUe97G7Y20+bccbxGuST89cKhLiTXHSt8z6q1lXytoyt0/Bvgez4/6SkD0qLC/D
	5PSDPI43QI9E+gHacBTIwuRkWZDveRW6gNe7dkhbsc75nfCNKxpVxamNvSn5a+w7X34AyxR
	o7yo
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0


On Wed, Nov 26, 2025 at 10:37 AM Qiang Ma<maqianga@uniontech.com> wrote:

>   For thread_count, the current calculation method has a maximum of 255,
>   which may not be sufficient in the future. Therefore, we are correcting
>   it now.
>
>   Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]
>
>   [1]:https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.9.0.pdf
>
>   Signed-off-by: Qiang Ma<maqianga@uniontech.com>
>   ---
>    arch/loongarch/kernel/setup.c | 9 ++++++++-
>    1 file changed, 8 insertions(+), 1 deletion(-)
>
>   diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
>   index 25a87378e48e..760f5ce44384 100644
>   --- a/arch/loongarch/kernel/setup.c
>   +++ b/arch/loongarch/kernel/setup.c
>   @@ -56,6 +56,7 @@
>    #define SMBIOS_FREQLOW_MASK            0xFF
>    #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
>    #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
>   +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
>    #define LOONGSON_EFI_ENABLE            (1 << 3)
>
>    unsigned long fw_arg0, fw_arg1, fw_arg2;
>   @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct dmi_header *dm)
>    {
>           long freq_temp = 0;
>           char *dmi_data = (char *)dm;
>   +       u8 thread_count;
>   +       u16 thread_count2;
>
>           freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>                           ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_FREQLOW_MASK));
>           cpu_clock_freq = freq_temp * 1000000;
>
>           loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
>   -       loongson_sysconf.cores_per_package = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>   +       thread_count = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>   +       thread_count2 = *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFFSET);
>
> You have `dm->length >= 0x30` below but the memory load already done here.
After reading thread_count2, it cannot be guaranteed that the data is valid.

'dm->length >= 0x30' can detect that thread_count2 is an available data, 
right?


>   +       if (thread_count != 0)
>   +               loongson_sysconf.cores_per_package = dm->length >= 0x30 && thread_count == 0xFF ?
>   +                                                    thread_count2 : thread_count;
>
>           pr_info("CpuClock = %llu\n", cpu_clock_freq);
>    }
>   --
>   2.20.1
