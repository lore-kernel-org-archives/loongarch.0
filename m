Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EAD5227
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711577308; cv=none; b=tXt71O8RTGEOs6rufsh2YX8Aj1O2SZrhoRwFGpc9oNw6qJkYID6zc0S9dc+mp5Rzxk/CbhNXmCdWBuRM0Ij14oRbQpdqt/i/RMdDJy18h4qoZ7Tfcay6RPWTe+1HKwszRO6bQiLiEuAsi0kfuhZl1QTIvifDsmlafZlmViBAQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711577308; c=relaxed/simple;
	bh=C0maMlcryh1cpCiza99ODbzXle0CXNALQm+Q6ihVJDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRR9iMwqU88b80X//NMHs+MqTdDs+vj3PDrOixFf0hIRdXpW92kxfnjg3upiG5/Fna3EZxSY7sOyYk4XVQsyXA4O8un2ifDykE4jIXGSLrBB9Hz7ekVSw9vN6wzbaGMU1JcrF8g6jNi5xs6K8QRzEoCUqWMTgG7SDMOZpK6yhos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=S8JSZVJO; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="S8JSZVJO"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7d05dc0709dso12718339f.2
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 15:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711577306; x=1712182106; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bmkqc/3aYewIsupa3aI44uZjMZk6uVE6sk1O51xM5oE=;
        b=S8JSZVJO6VtM7akUZql01N7wAvrqTfVIx5IZTdeFH+RDxqStbsjNQCM7Y1vsweiru/
         8VqCdnzlme0uFHD7ydWCpsBZB6dSI7iPPwaheYioZMwJYXNg77BqBjdlMKElW1n8gg4u
         Uh7ah/MLkJbBGnZhvT3X7JdwtBiZA92OScyvspGCPsFR1J1uy0Ceo7WLwe7NsCeoQlLr
         aKtaCdrLnjW/yYY3X3z7mmCIAfbJP39HTZoLU5o4WcXfxtGF0FzKlfiMxbPz1OulPW2n
         IEZjNN7wVvGwkNmNO8fQ5NBmo4q0zV7BNxMoOZYqvSifuxDXKslozHA3mUD/EnKnKmwU
         DGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711577306; x=1712182106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bmkqc/3aYewIsupa3aI44uZjMZk6uVE6sk1O51xM5oE=;
        b=prSAgTzZMq+2WXVk5/Fq1TaPP5tS9XskTFoPtr27ymnY9tu+6q+tS2cNHCdgP/lzrN
         F0xdPImp4kOJ0yAwTmjBSuQcxOvb+zo9Os2Xsfd5ROpZdqAY9s/eUJPL3wFBCo8vDrwB
         1zvIQvn+dZcNcwOOg6d9xISlwlxP4bzTiVxQ3Cd9ou2cCtMhyu6MLrebaRLlHax4ZXbG
         a6xvRmtk1besXG5JHkChiV3xVa38xLXO45EQsutTZdPHPwR5z8hj+7V8lnVhK72eErAO
         ZSh+zxbffJail1hjhMq87xQToyqmQj/cbIQT8eMfBGc3jZKl24dTg+EcG5GQG0q1mACp
         t4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUMr6MuLOWHZKow6lShfn58BTXrbj1JlfJpuzMeN6rHDUCVct6jk2QSxziZSfWjXBxHTUDBi5LSnOTjl2VGdgRtXd0mAWfLARS0
X-Gm-Message-State: AOJu0YzYqYcy78Hu2bUcnos6MvBvVoXvSh0eUGL7SowOKur3Gg5FbRMY
	+i1YmxDThLlTwl3j01OqYN97B/J1vD72K7Sjze46vga+wNThjbRE9Bzm9hAkcbw=
X-Google-Smtp-Source: AGHT+IGUYm3Y8wBDca1kE2cHOU4Wfjx7H338gBLx60QGaDb6jbN+3GFHHCGUs0OMGF33wA7wIsUyRw==
X-Received: by 2002:a6b:f919:0:b0:7cb:ffd8:1546 with SMTP id j25-20020a6bf919000000b007cbffd81546mr1424618iog.19.1711577305709;
        Wed, 27 Mar 2024 15:08:25 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id f12-20020a056638118c00b0047bea529fddsm2373jas.104.2024.03.27.15.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 15:08:25 -0700 (PDT)
Message-ID: <4d9633cd-15c4-4cc1-ac67-2592e9fc7880@sifive.com>
Date: Wed, 27 Mar 2024 17:08:23 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
 <20240327200157.1097089-13-samuel.holland@sifive.com>
 <20240327142516.e4b1f9ba6e2ec7bc300e4d58@linux-foundation.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240327142516.e4b1f9ba6e2ec7bc300e4d58@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-27 4:25 PM, Andrew Morton wrote:
> On Wed, 27 Mar 2024 13:00:43 -0700 Samuel Holland <samuel.holland@sifive.com> wrote:
> 
>> Now that all previously-supported architectures select
>> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
>> of the existing list of architectures. It can also take advantage of the
>> common kernel-mode FPU API and method of adjusting CFLAGS.
>>
>> ...
>>
>> @@ -87,16 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
>>  	WARN_ON_ONCE(!in_task());
>>  	preempt_disable();
>>  	depth = __this_cpu_inc_return(fpu_recursion_depth);
>> -
>>  	if (depth == 1) {
>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +		BUG_ON(!kernel_fpu_available());
>>  		kernel_fpu_begin();
> 
> For some reason kernel_fpu_available() was undefined in my x86_64
> allmodconfig build.  I just removed the statement.

This is because the include guard in asm/fpu.h conflicts with the existing one
in asm/fpu/types.h (which doesn't match its filename), so the definition of
kernel_fpu_available() is not seen. I can fix up the include guard in
asm/fpu/types.h in the next version:

diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index ace9aa3b78a3..75a3910d867a 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -2,8 +2,8 @@
 /*
  * FPU data structures:
  */
-#ifndef _ASM_X86_FPU_H
-#define _ASM_X86_FPU_H
+#ifndef _ASM_X86_FPU_TYPES_H
+#define _ASM_X86_FPU_TYPES_H

 #include <asm/page_types.h>

@@ -596,4 +596,4 @@ struct fpu_state_config {
 /* FPU state configuration information */
 extern struct fpu_state_config fpu_kernel_cfg, fpu_user_cfg;

-#endif /* _ASM_X86_FPU_H */
+#endif /* _ASM_X86_FPU_TY{ES_H */


Regards,
Samuel

