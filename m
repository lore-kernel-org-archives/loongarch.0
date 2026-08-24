Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAF44C645
	for <loongarch@lists.linux.dev>; Mon, 24 Aug 2026 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586315; cv=none; b=fQCgtiqVCMv2f/71LA5AyPtXOh4ElmabtZ0Vg7X6EA1Z5zSmUdOu8S/uJIpbYSxlWQDL1ioHtPTxVa2mVPtBegqpTSqxdQU2FvDUS4KgeNCf2o8aE3eqDokgmeXQCXJhN6Ki0WkGpMREXt//8M9e/a9pWHN4I25Ggk02VujA3Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586315; c=relaxed/simple;
	bh=rH5ooTmhOET3vAsIUkA6yaGvEUpGPYpVuc1a+dr0RM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKC3WfRv2rO5TLozaaTPTVtjlUumBSM9cY9QxV8XxlXEDQNKCAYbXRHwiNJEt3TmYi6kfnHKOi2iklHxyZ/wSiNdd0lmWiVy0WF2demFPIMcEwUXxUysmWbLB7e/2t160BiZZ/3PLQF5eCkBWwr5iAfDbuHaxNL7euiQVXh+ibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=SNOUSjm/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SNOUSjm/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cab973140bso47081415ad.3
        for <loongarch@lists.linux.dev>; Mon, 24 Aug 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787586312; x=1788191112; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=SNOUSjm/+PPqNPJoYPMLtDlY3U0G8uN6OllXlp+fK1xhq8mcDQD0SrGXs2iPMltYVA
         xQg5jTnXBxFlpIquuSkbwQOjjA79VpDHUE8IFrlqo1RoSkm6CAn1bUWNgrq/C8SZyQSO
         8mkw3SBF6hgxXiFDU6w/89EokKLhqVSzKfjdDBLo++XPc+hUzxhwTnn3TrATvW12z6Y+
         VMw1OWkbkYIf289qw7SynJtzTI82vN9xkW571sHy/Fbv17QUq9mqdvvc+h4bRcjei+wl
         AQVwb23Yoy0RHsNuMuNK1Il2oQ9F9fWdSAUleHF54IFHVhBOZqDZFt/VCbEgGih6TBq0
         sNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586312; x=1788191112;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=PBgI3bFDHe9kCumJsz2V0vH2CsPAf/CrsvEHXSir6FAUKP2DPJXh0kakZhR5rc36SZ
         nsnqr5RO1Ta7vHMV6OKLNxLmQHsxWSPvOYUYN4Su3tsxx3gsUbsZQ2AvFm/9Rkzd1TXb
         oE0smFl561WsXoLzk2fRNdnw8qbWTedkUZ2RKB2a1/rlevPqdK1CG0ErLD6l7sPJzcSs
         /R+7F2uX+MBklVydB7TL/hs/w7EA5HVFv678lNJPAD0SXT60fLseUZWu/greGL84jCFt
         WxHyt/yETjLxyUgajND0OIU85JfiY68qOZb1iLuYIDR8QrEXLAKoEV5ctBbYwJY9ZqO2
         Sl2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq5+bSBAwj4beyEeBqMMn6EhgDBcdOvL/YutRXeKPaGkpf9SG9yj1g1HJkgryVovx2b1e0In/N3yVY=@lists.linux.dev
X-Gm-Message-State: AFuF++ncNHECs2hYmnCxs953PpE+PkGWyZnUn+QxKiIa4W/qz6WXI3TA
	zdJXUESVY+VmfopZeUETb60TK0cf3mAO/cCfg8JdK1nypeJBl11lR20eySZ6FWR0Ypo=
X-Gm-Gg: AR+sD115oZUqhsLIxwn8l7m5ef+mn6hDVnLzaiU2SbjOkn/AV+8vVc1Dy1i44pb03bl
	Bu68EDT4l2JlBtETO3xaoMeOd31jU/fYSN6Gl/141P3EWIj7cYID9IGq27D//sg0fR5rll8gix2
	jwOUZeXRufDBzNpQjH7gcjhpV4ydiutIkT2fYdU9NfTOUfnQDfp+Q11TJeXKqPnrMUgsbKle6+B
	knVnYrk9BJO4iFe7WodZjjNdX/SpmxYT8OytxL4y/2VPsCz+r1NURlf+r0q3p4PNOBn9O3Sxfih
	6gKgyI355bkpG+ICBi+Ktw7LmSFID6wnh7HeoCgVvtZdPA9UWQx980AksbxtpdBRl6GkxslhWZo
	ctoCb0XwFlt1znC6q2+WfyhrTo0zydxqBxtj1SEQa6ZNoMeE/5NnI4dyjjHP3QNZEV2OvJcCcVh
	z2e6ZNasZZyzrPJxyq4JMPxUZ49bLaNima+SmS/E2YKntfi2VnWvKsOgMD3X9kovpWfSA6Qmv1g
	T8beaxgzy7ubmk=
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr39252435a91.15.1787586312489;
        Mon, 24 Aug 2026 08:45:12 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm23611a91.10.2026.08.24.08.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:45:11 -0700 (PDT)
Message-ID: <029cfde8-74fc-4437-bc18-b1b53d44cab2@sifive.com>
Date: Mon, 24 Aug 2026 10:45:09 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 1/8] mm: Make ptrval_to_str() generally available
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
 <20260818040041.1891769-2-anshuman.khandual@arm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260818040041.1891769-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-08-17 11:00 PM, Anshuman Khandual wrote:
> Move ptrval_to_str() inside a header thus making the helper more generally

Typo here and in subject: ptrval -> ptval

> available for new users which are being added later. While here, also move
> another related string size macro PTVAL_STR_MAX inside the header as well.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/mm_types.h | 15 +++++++++++++++
>  mm/memory.c              | 16 ++--------------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b18c2b2e7d2c..a5b514e55dd7 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -2001,4 +2001,19 @@ static inline unsigned long mmf_init_legacy_flags(unsigned long flags)
>  	return flags & MMF_INIT_LEGACY_MASK;
>  }
>  
> +void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size);
> +
> +#define ptval_to_str(buf, val)								\
>...
