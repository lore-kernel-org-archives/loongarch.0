Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911D125BE
	for <loongarch@lists.linux.dev>; Fri, 20 Oct 2023 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jzRRY2jA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nkRbIeka6D9hktLXrz9eFYF7RLBS9b1Mb7EA0LnaqAs=; b=jzRRY2jAbC2JrZLmV54U9W9qOw
	bkMbHIH76swqn1SPX8cjp9ieDsdG2VK6K5DGZuYnZjvJwoX6gM9emZhNGBDcOslLMFqNIgQhHL4eW
	zHxsLLoqRn3jd7SjLKt34XEe1QTuZD/305FtFLOOsM64rr87VAvsHuyil1OzbJlufo/YZZ4gHmrfD
	9EffeYn9BIPaN7eGWsSM9u7g8RTy9dzl0Ke04YI1jK22TwqkIxW22vaHDPweLfbIAlw6ow08Z7Xxy
	1WRFjclpnnili5RaGOobS1A7n9X7VRROHtbRfJ7eUiEWiUeamao+//QCRCjzWntSuk4+LUL+QZgsi
	RjUAbdGQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qtlpw-00CKzN-D5; Fri, 20 Oct 2023 09:30:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 16BAB300392; Fri, 20 Oct 2023 11:30:32 +0200 (CEST)
Date: Fri, 20 Oct 2023 11:30:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3 5/8] objtool: Check local label about sibling call
Message-ID: <20231020093031.GB31411@noisy.programming.kicks-ass.net>
References: <1697768821-22931-1-git-send-email-yangtiezhu@loongson.cn>
 <1697768821-22931-6-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1697768821-22931-6-git-send-email-yangtiezhu@loongson.cn>

On Fri, Oct 20, 2023 at 10:26:58AM +0800, Tiezhu Yang wrote:

> +		if (reloc && reloc->sym->type == STT_NOTYPE &&
> +		    strncmp(reloc->sym->name, ".L", 2) == 0)

> +			if (reloc->sym->type == STT_NOTYPE &&
> +			    strncmp(reloc->sym->name, ".L", 2) == 0) {

Would not something like the below be better?

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e308d1ba664e..a57d293c834d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2506,6 +2506,9 @@ static int classify_symbols(struct objtool_file *file)
 	struct symbol *func;
 
 	for_each_sym(file, func) {
+		if (func->type == STT_NOTYPE && strstarts(func->name, ".L"))
+			func->local_label = true;
+
 		if (func->bind != STB_GLOBAL)
 			continue;
 
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index 9f71e988eca4..2b8a69de4db8 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -67,6 +67,7 @@ struct symbol {
 	u8 profiling_func    : 1;
 	u8 warned	     : 1;
 	u8 embedded_insn     : 1;
+	u8 local_label       : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 };
