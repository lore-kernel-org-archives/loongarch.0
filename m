Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E31D9A5F
	for <loongarch@lists.linux.dev>; Tue,  1 Sep 2026 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265820; cv=none; b=s4PHlbfz1vqrYc+ti8gKi+p+utnpVLNViiI7PyeQnWEmhIT8tgqS5gHrNc+wEosGeWXJm3ErowPD6jPkJ1eNViwWkhb7p4Uo7Xzjhibx3rR72AnZJwMNKQsG1YCW12+Yj4yVQiwj7dTdWraWoTDUPbWh/AFr4ALI0hNeUwCV0Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265820; c=relaxed/simple;
	bh=xThUvjdylwBDO6UwJ5v4XHaCCBR8EDO8ug8okqY3IZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvVFH+wv7PccS7yX364hfBb0jgnrM5BdPDdEtQNekj1rJvN+IMQhlimXV7mEPE3RTjFd5HSV45XtdOAL4AA5py4LstJpHZWeAFdZ3lcvgpgEujD8wvrGJbtsxQnXM6sIluXwOrtu8hBp09XSq4erQHbjfwbiqUYbT3cInOmzRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NcxSu4rl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NcxSu4rl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso10137545e9.2
        for <loongarch@lists.linux.dev>; Tue, 01 Sep 2026 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788265816; x=1788870616; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKiEJer3Nyo4mzcV6ZXVsxbGmSZdi3jrQ8wILC+MmI8=;
        b=NcxSu4rl5Loc5kZxiUIv1AYzmbtOjevFrJ27tcCGGYkg/mVgsGhDMOTyEg/wItwHci
         gcLlN6sPYoSDc9+M9e4vgeXohmIIhXhHGLWyp1vCilLxGhiGm4BF1Kl1BLh+7CWxr8F7
         WevSi2o0Vv2L72RzYhlevLi9PLGAe2xThjW0PTQE3uctcSk3ILZK8R6EHcDSYLP1Ofwm
         HroiSMfNWPcRkM3ZMKc4xAslUK0IrlKV1NO1/O4PDivZeIRnUpcV2WvW+5MZw+dI9L3M
         tVFTlsjl7nW8fR/hxT+NFNTKnaYQSiFoeHZpCrLRtHz/6vpmc1rHolakUtpFTZDGzIzv
         eHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265816; x=1788870616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKiEJer3Nyo4mzcV6ZXVsxbGmSZdi3jrQ8wILC+MmI8=;
        b=eWI+tBdQCJcJgpcCa7AGiXoLwZZyBWtgEltmodTVdtqJMW7Tscs6Mry/uedR4iZK2F
         8OW32HCSo4YexebJ5NHFNzr7vUeGlF2t0KeaJixTo9hy5sQWqLf5OBNm8wr8se4wY8fZ
         94cZDez3t95GSTDRMuzRBjdsJkF/h1tg9UB92EmALIR6V9+GP7VGVgaxOsLnlwUQwsWS
         Z0HRWPOVYft9q2KJNKqWGpeQFum9PmfqvoFXTqf2LmLCJRsyRpNjauSxsh3bqnQOO47D
         f1hTgQbQqN9bPh1YkCtm3/zfJWB6AMyA4DC5+tA74dhyPBcuiP1Jys9/G82GE7EUksl8
         AYrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvH+mA8jAP2SoIpkUCCE1vh0ZAYSh3UQkOYBmXZmogHpTE1DygMSSOaPdQqWHQ2ijHPrTv2u3h7Yg=@lists.linux.dev
X-Gm-Message-State: AFuF++kvTFeHVVPBowIJZ95HHCsrYZRA9AE0Gd015E0O83Hi8VWj3Jwd
	5DzjRXxH+oIOAj7b66w0JRrSo6kVKjKjBhZerpSsrhXw/1YlUKFv/r8+CKw4Nt1VXwQ=
X-Gm-Gg: AR+sD12DnVRenuO6aCFbV8RvEGT9OXhcwOA/ptMvD8xAvSWVAGSUCMVidUv516FkOIT
	hLNs1qKgrd9USmkkhG8p8m8vnuQ+VpzoyIlr8WEWkBtvVku/n/rhMw2PplaM6abzjPW7IOuLDrd
	KpTIMrHSvuY//dKxvbdKZkyxvp9a1gSx4F0Rno6Z2RqnvVRwMca7PW2zQq4gV+nI8BqcGi4YPzW
	IrsNxIxB8INHrBRFrKhWXHVu0BqyVpRcdTJ//p3KS4Ozb4UatZ15VYbdncCEJFFeyOeCGGI4ecY
	siIx8xXUwLzfSNvsF95nNcZQZHWVrZPYTrajSPxNao394kEkIKR6p06CroDDDDDySnDTEQd0wg+
	NPFPpBMjSi7yLwh90eLvh/ShE3xllKr0Uv66122ez/lJrdakhqP2jmPzL/GMFqMwAl2UObXZmW/
	7zzNL0+EPFY1MaX2gIvPdWUJZFdzkZ67qBPMKGYTEHB5P0XnF4thK1jH5mqByZJtvPGSjNdXw0v
	PNCyZ8ABiMHbbXppA83Up0t
X-Received: by 2002:a05:600c:34ce:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49cdc572c7dmr156945315e9.15.1788265814193;
        Tue, 01 Sep 2026 05:30:14 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm61698825e9.9.2026.09.01.05.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:30:13 -0700 (PDT)
Message-ID: <aa0a7e8a-c0f2-437d-b530-da23fe595858@suse.com>
Date: Tue, 1 Sep 2026 14:30:13 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] module/kallsyms: Rename is_mapping_symbol() to
 is_ignored_kernel_symbol()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-modules@vger.kernel.org, loongarch@lists.linux.dev,
 Josh Poimboeuf <jpoimboe@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
References: <20260820125007.22943-1-yangtiezhu@loongson.cn>
 <20260820125007.22943-2-yangtiezhu@loongson.cn>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260820125007.22943-2-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/26 2:50 PM, Tiezhu Yang wrote:
> The helper function is_mapping_symbol() historically checks for both
> local labels prefixed with ".L" or "L0" and mapping symbols prefixed
> with "$".
> 
> Rename it to is_ignored_kernel_symbol() to better reflect this actual
> behavior and scope, preventing conceptual confusion.
> 
> While at it, update the related non-module files, no functional changes.
> 
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
