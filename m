Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74AE1A83E2
	for <loongarch@lists.linux.dev>; Wed, 26 Feb 2025 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537656; cv=none; b=RoD6X6WBldRYKAAYMuz/RMreitwKmnF1onVCJOXNVdZrD7vzOSEG22J7DreyXdnJl0eCfN1AoqKrunWQPxrhh6MS0Hhumk13rQuwwU2PKlwxkDGVq7vboImGvS7BRuqkKjRFHMZQK+mCIxj6JUelB/lubLrfV6jhZF0nbVJbgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537656; c=relaxed/simple;
	bh=wjq1hhNmQD/Y69/cVuHxDfp8iNsL790jhspOLVSqRqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C25lopUSgqYTRXlJgsozVvBOOcLsTdXOypb6UygnKTCeUjSdtRL+45AD2mMaOul03RtcxD1OYWhuYLkRu2qcT57XrIqDEzxs+Pl31Sga1XqhOm8P/kasvA1YKjQ9myxmKonJpJkT41YfniiqVmKXZnVdnYkUTlLOGQ5RwmkzNoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IogWwoI0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IogWwoI0"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fe848040b1so310757a91.3
        for <loongarch@lists.linux.dev>; Tue, 25 Feb 2025 18:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740537654; x=1741142454; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=;
        b=IogWwoI0IdRN5XLLzGvB0y+kuyti9l0G6BsEn6sv311s3UityEEGN5Df8yV/D1ZpLJ
         cQ6VRWZWWkbKb3aFz1aOKSIcPznqmP4bY4YQNljlEren9LWDhn3V2DQl/39IcFhK4FKd
         6iYip2J8/RQUkroVE9a9zF9VaaRj8OuOMMDl7Vto2eXuqZGUejuOyKovsKTlMbEFPARa
         HWZkseMaLeBXmDm6kbnU+MW9wFxSDwVaVJ1IUwJRDb9Hp+1XZrNPjDgqmxv6RuX8jZgR
         5IcSakAVbkqweOtVgzPz0KgYK+nbXlj4dPsAnLUAoXlILxw7YYCaDmMbzwtLblVL+9f9
         Q1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740537654; x=1741142454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=;
        b=dKMU2nE/eEohB2UbIvCZwebdT9cpcW5sqhdS2jzkGCoQECrlarTIeY7mptj380j9RU
         hVc/WrWUTNoQS/oNXvXoyNAhAprtCVvO8wJEWexynQGVXFyFuIuVXrVEaseMjod0AAgI
         49XGzVfjgzRXAdwKpKop9Y1o+MTAb+5zcydIzCo81cdr0rcC1aytqmZKxscrL/ziiG3e
         6SLVSSfavmPsmrwUxxnfAFWTn+jmW1f9CidHaolyFtiXG6T1Mxul/Nt+ekk5oVy1fgSf
         j/NeDf9328GC63gaD6SjG2e7YnAdtT4bEswESpyu3STNjwUv7ZMNDf4q7RXZm5w3BaTg
         PttA==
X-Forwarded-Encrypted: i=1; AJvYcCWii8r2D5GeBBFjZOdTvfLuNJAiMPzQdfjdoG0LLAoY53bIbsw1sJuNQNKed7KPZRZv7rdKhu140ko=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUyFwquGKT4waRyrBN8lSoLxnnrl+GF8AqQcuykBxLAWQ8J7RB
	joKmvBmNrEFkYoi3irDTZtCmR7OreVBA62be7gZszkXAOHawmEdxWFY7exPFJl0=
X-Gm-Gg: ASbGncsuopsN+XxCLnTkX7eyaEtjtM+7bhSt0QEydr/Mi0UGnLo+O1rmlnPgOnZUmf8
	9h2Z0PgjpEJHRQ2FNcREyE7GKKo/si0ZvvJBrTVg5xM4cxtJ05oj55t8Uu+HUHQZaf61CDJ/NW+
	A1NDqUxXCrZPWUE5DX4WHJ+FdN6CzH18Y3+hCyBRWZ68y3RDTEugR+qpBLvqrY2jLwg3JEZgsMC
	5OBCGnuJKukgjmxg1SrHouIFJt1UWiDSzq1YUBL0766dmqYuCZbGs5dJhbChKchiQec27NbXic7
	aWYTtBPfmj+KdprbZ3dSaK37SaYB7DNDA5hvXA+afuAnTJFLtw==
X-Google-Smtp-Source: AGHT+IGBavOro6p44pm0knw7epDm1Ms4/cRCm5nI7A9v1bvB0aFlwIUaa3TK9A89BXdQQHklrRCMwg==
X-Received: by 2002:a17:90b:2242:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fce868c4f9mr34212880a91.7.1740537654049;
        Tue, 25 Feb 2025 18:40:54 -0800 (PST)
Received: from [10.68.122.90] ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a000a01sm21742845ad.40.2025.02.25.18.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 18:40:53 -0800 (PST)
Message-ID: <3e3ab5b0-4669-4d7a-a7bd-6f5963662757@bytedance.com>
Date: Wed, 26 Feb 2025 10:40:42 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
 <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/26/25 上午10:35, Andrew Morton wrote:
> On Tue, 25 Feb 2025 11:45:55 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>> The x86 has already been converted to use struct ptdesc, so convert it to
>> use tlb_remove_ptdesc() instead of tlb_remove_table().
>>
> 
> This is dependent upon Rik's a37259732a7dc ("x86/mm: Make
> MMU_GATHER_RCU_TABLE_FREE unconditional") from the x86 tree.  I'll add

Yes.

> Rik's patch to mm-unstable also and shall figure it out during the
> merge window.

Thanks!


