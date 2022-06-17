Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEF32CA4
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 10:55:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb062Xaxi1GBIAA--.27263S2;
	Fri, 17 Jun 2022 18:55:51 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org,
	alexs@kernel.org,
	bobwxc@email.cn,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	corbet@lwn.net,
	kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	linux-doc@vger.kernel.org,
	siyanteng01@gmail.com,
	loongarch@lists.linux.dev
Subject: [PATCH v3 0/2] docs: Improve loongarch documents
Date: Fri, 17 Jun 2022 18:57:26 +0800
Message-Id: <cover.1655463225.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9Dxb062Xaxi1GBIAA--.27263S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr4DCF1UtF4UGFy3uF4DArb_yoWfJwc_uF
	Z7Jay5Aw42gFyrWaySkr13AF98JF4j93W5AF1ktrZFkFy7trsxAr4DGrWFvr1IqFsrCrZ8
	KrWkXryrAr12qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI
	42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfU52NtDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/

v3:
Modify Subject.

v2:
Fix ``inline literals``.
Delete "注：" of zh_CN patch.
Add fix tag.

v1:
Rewrite all the notes in the loongarch document.
Note is an admonition, let's use the directives
implemented in the reference reStructuredText parser.
About reStructuredText Directives,
see <https://docutils.sourceforge.io/docs/ref/rst/directives.html>

Yanteng Si (2):
  docs/LoongArch: Fix notes rendering by using reST directives
  docs/zh_CN/LoongArch: Fix notes rendering by using reST directives

 Documentation/loongarch/introduction.rst      | 15 ++++++++-----
 Documentation/loongarch/irq-chip-model.rst    | 22 +++++++++++--------
 .../zh_CN/loongarch/introduction.rst          | 14 +++++++-----
 .../zh_CN/loongarch/irq-chip-model.rst        | 14 +++++++-----
 4 files changed, 38 insertions(+), 27 deletions(-)

-- 
2.27.0

